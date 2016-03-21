# Middleman::GhPages

Middleman deploy to GitHub that just works.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'middleman-gh_pages'
```

Or install it yourself as:

```
gem install middleman-gh_pages
```

## Usage

Add the following to your middleman `config.rb` file:

```ruby
activate :gh_pages do |gh_pages|
  gh_pages.remote = 'git@github.com:an_absolute/github_remote_name.git'
end
```

Adding an absolute remote name is a requirement, so we don't have to infer
where to deploy to.

The deploy is always one commit that is forced pushed into the gh-pages branch.
You'll never run into merge conflicts, or an unemployable state. You can deploy
anything, as long as you can force push to the `gh-pages` branch.

```
$ middleman gh_pages
```

Hooray!

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/gsamokovarov/middleman-gh_pages. This project is intended to
be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
