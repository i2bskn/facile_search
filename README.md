# FacileSearch

Simple search with inverted index.  
(Index data is stored in the Redis.)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'facile_search'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install facile_search

## Usage

```ruby
meta = FacileSearch::MetaData.new(namespace: "example_index", text_field: "text")
index = FacileSearch::InvertedIndex.new(meta)
sample = Struct.new(:id, :text).new(1, "some text")
index.indexing(sample) # => "OK"
index.search(["text"]) # => [1]
```

## Contributing

1. Fork it ( https://github.com/i2bskn/facile_search/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

