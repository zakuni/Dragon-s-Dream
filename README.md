# Dragon's Dream

RailwayInfo via [HeartRails Express](http://express.heartrails.com/)

[![Build Status](https://travis-ci.org/zakuni/Dragon-s-Dream.png)](https://travis-ci.org/zakuni/Dragon-s-Dream)

## Installation

Add this line to your application's Gemfile:

    gem 'dragons_dream'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragons_dream

## Usage

```ruby
require 'dragons_dream'

dd = DragonsDream::RailwayInfo.new
dd.stations_list("JR山手線")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
