# FacileSearch

[![Build Status](https://travis-ci.org/i2bskn/facile_search.svg?branch=master)](https://travis-ci.org/i2bskn/facile_search)
[![Coverage Status](https://coveralls.io/repos/i2bskn/facile_search/badge.svg)](https://coveralls.io/r/i2bskn/facile_search)
[![Code Climate](https://codeclimate.com/github/i2bskn/facile_search/badges/gpa.svg)](https://codeclimate.com/github/i2bskn/facile_search)

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

Create inverted index object.

```ruby
meta_data = FacileSearch::MetaData.new(namespace: "example_index", text_field: "text", id_field: "id")
index = FacileSearch::InvertedIndex.new(meta_data)
```

Indexing and search.

```ruby
sample = Struct.new(:id, :text).new(1, "some text")
index.indexing(sample) # => "OK"
index.search("text") # => [1]
```

## Contributing

1. Fork it ( https://github.com/i2bskn/facile_search/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

