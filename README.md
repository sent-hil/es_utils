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
    # this requires `elasticsearch`, so you don't have to again
    require "es_utils"

### kibana

    # I find this time format `%FT%T%:z` or `2014-06-29T18:26:54-07:00`
    # to be best for kibana. This library monkepatches `Time` to add
    # `kibana` method.
    Time.now.kibana

### scroll_each

    # `A scrolled search allows us to do an initial search and to keep
    # pulling batches of results from Elasticsearch until there are no
    # more results left. It’s a bit like a cursor in a traditional database.`
    #
    # http://www.elasticsearch.org/guide/en/elasticsearch/guide/current/scan-scroll.html
    #
    # `scroll_each` abstracts away the bookkeeping logic. It takes `options` Hash
    # and a block which is called on the results of each scroll.
    client =  Elasticsearch::Client.new
    options = {
      :index       => <index_name>,    # required
      :scroll      => "5m",            # optional
      :size        => 10,              # optional
      :body        => {:sort => "_id"} # optional
    }

    client.scroll_each options do |results|
      results.each do |result|
        # add your logic here
        # example: puts result["_source"]
      end
    end

### bulk_index

    # `bulk_index` removes away need to pass index name and type as part
    # of each document when doing a bulk indexing operation.
    documents = [ {a: 1}, {a: 2}, {a: 3} ]
    client.bulk_index(:index => "es_utils", :type => "doc", :refresh => true, :body => documents)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
