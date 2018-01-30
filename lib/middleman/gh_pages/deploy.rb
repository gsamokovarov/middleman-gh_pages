require 'fileutils'

module Middleman
  module GhPages
    class Deploy
      include FileUtils

      def initialize(options = {})
        @build_dir = options.fetch(:build_dir)
        @remote = options.fetch(:remote)
        @branch = options.fetch(:branch)
        @environment = options.fetch(:environment)
      end

      def call
        bundle.exec 'middleman', 'build', '-e', @environment

        Dir.chdir(@build_dir) do
          rm_rf '.git'

          git.init
          git.remote 'add', 'origin', @remote
          git.add '.'
          git.commit '-m', "Deploy on #{Time.now}"
          git.checkout '-b', @branch
          git.push '-f', 'origin', @branch
        end
      end

      private

      def bundle
        @bundle ||= Command.bundle
      end

      def git
        @git ||= Command.git
      end
    end
  end
end
