# es_utils

This library contains a bunch of improvements to `elasticsearch` ruby gem.

## Installation

Add this line to your application's Gemfile:

    gem 'es_utils'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install es_utils

## Api
    require "elasticsearch"

    # be sure to require only AFTER `elasticsearch` gem
    require "es_utils"

### Kibana

    # I find this time format `%FT%T%:z` or `2014-06-29T18:26:54-07:00`
    # to be best for kibana. This library monkepatches `Time` to add
    # `kibana` method.
    Time.now.kibana

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
