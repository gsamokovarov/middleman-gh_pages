# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman/gh_pages/version'

Gem::Specification.new do |spec|
  spec.name          = 'middleman-gh_pages'
  spec.version       = Middleman::GhPages::VERSION
  spec.authors       = ['Genadi Samokovarov']
  spec.email         = ['gsamokovarov@gmail.com']

  spec.summary       = 'Middleman deploy to GitHub that just works.'
  spec.description   = 'Middleman deploy to GitHub that just works.'
  spec.homepage      = 'https://github.com/gsamokovarov/middleman-gh_pages'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
end
