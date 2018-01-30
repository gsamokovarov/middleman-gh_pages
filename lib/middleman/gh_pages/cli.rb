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
        {
          build_dir: app.config.setting(:build_dir).value,
          remote: GhPages.options[:remote],
          branch: GhPages.options[:branch],
          environment: options['environment']
        }
      end

      def app
        environment = options['environment'].to_sym

        Middleman::Application.new do
          config[:mode] = :build
          config[:environment] = environment

          Middleman::Logger.singleton(1, false)
        end
      end
    end
  end
end
