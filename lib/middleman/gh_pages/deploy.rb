module Middleman
  module GhPages
    class Deploy
      def initialize(options = {})
        @build_dir = options.fetch(:build_dir)
        @remote = options.fetch(:remote)
        @environment = options.fetch(:environment)
      end

      def call
        bundle.exec 'middleman', 'build', '-e', @environment

        Dir.chdir(@build_dir) do
          git.init
          git.remote 'add', 'origin', @remote
          git.add '.'
          git.commit '-m', "Deploy on #{Time.now}"
          git.checkout '-b', 'gh-pages'
          git.push '-f', 'origin', 'gh-pages'
        end
      end

      private

      def bundle
        @bundle ||= Command.bundle
      end

      def git
        @git ||= Command.git
      end

      def rm(*args)
        Command.rm(*args)
      end
    end
  end
end
