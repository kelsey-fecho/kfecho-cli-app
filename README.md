# Winecli

Welcome to the WineOs Gem! This gem allows you to browse a selection of wines from TotalWine.com in your CLI, learn more about wines, and purchase wines from TotalWine.com.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'winecli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install winecli

## Usage

This is a great way to browse wines without all the extra fluff. A few lists of wines has been preloaded into the gem. For additional lists of wines from TotalWine.com, use ```Scraper.new(url).scrape``` to build your collection.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/winecli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Winecli project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/winecli/blob/master/CODE_OF_CONDUCT.md).
