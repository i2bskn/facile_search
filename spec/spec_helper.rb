$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "facile_search"
require "pry"

Redis.current.flushdb

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.order = :random
  config.raise_errors_for_deprecations!
end

