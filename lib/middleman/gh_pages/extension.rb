module Middleman
  module GhPages
    class Extension < Middleman::Extension
      option :remote, nil

      def initialize(app, options_hash = {}, &block)
        super

        yield options if block_given?
      end

      def after_configuration
        GhPages.options = {remote: options.remote}
      end
    end
  end
end
