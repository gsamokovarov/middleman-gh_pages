module Middleman
  module GhPages
    class Extension < Middleman::Extension
      option :remote, nil
      option :branch, 'gh-pages'

      def initialize(app, options_hash = {}, &block)
        super

        yield options if block_given?
      end

      def after_configuration
        GhPages.options = {
          remote: options.remote,
          branch: options.branch
        }
      end
    end
  end
end
