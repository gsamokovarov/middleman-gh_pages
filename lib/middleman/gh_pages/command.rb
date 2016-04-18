module Middleman
  module GhPages
    class Command < BasicObject
      class Error < ::StandardError
        attr_reader :status

        def initialize(status)
          @status = $?.exitstatus
        end
      end

      class << self
        def method_missing(name, *args, &block)
          command = new(name)
          if args.empty?
            command
          else
            command.public_send(*args, &block)
          end
        end
      end

      def initialize(cmd)
        @cmd = cmd.to_s
      end

      def method_missing(name, *args, &block)
        unless ::Kernel.system(@cmd, name.to_s, *args.map(&:to_s))
          ::Kernel.raise Error
        end
      end
    end
  end
end
