module Middleman
  module GhPages
    class Cli < Thor::Group
      include Thor::Actions

      check_unknown_options!

      namespace :gh_pages

      class_option :environment, aliases: '-e', default: 'production'

      def self.exit_on_failure?
        true
      end

      def gh_pages
        Deploy.new(deploy_options).call
      end

      private

      def deploy_options
        GhPages.options.merge(
          build_dir: app.config.setting(:build_dir).value,
          environment: options['environment']
        )
      end

      def app
        Middleman::Application.new do
          config[:mode] = :build
          config[:environment] = options['environment']

          Middleman::Logger.singleton(0, false)
        end
      end
    end
  end
end
