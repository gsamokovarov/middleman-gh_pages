require 'middleman-core'
require 'middleman-cli'

module Middleman
  module GhPages extend self
    attr_writer :options

    def options
      @options ||= {}
    end

    autoload :Command, 'middleman/gh_pages/command'
    autoload :Deploy, 'middleman/gh_pages/deploy'
    autoload :Extension, 'middleman/gh_pages/extension'
    autoload :Cli, 'middleman/gh_pages/cli'
  end

  Cli::Base.register(GhPages::Cli, 'gh_pages', 'gh_pages [options]', 'Deploy to GitHub')
  Extensions.register(:gh_pages) { GhPages::Extension }
end
