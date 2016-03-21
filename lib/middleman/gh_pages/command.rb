module Middleman
  module GhPages
    class Command < BasicObject
      class Error < StandardError
        attr_reader :status

        def initialize(status)
          @status = status.exitstatus
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
        @cmd = cmd
      end

      def method_missing(name, *args, &block)
        status = Kernel.public_send('`', [@cmd, *args].join(' '))
        unless status.exitstatus.zero?
          raise Error, status
        end
      end
    end
  end
end
