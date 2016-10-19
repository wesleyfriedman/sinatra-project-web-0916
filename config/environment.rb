require 'bundler/setup'
Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = '73mXLJ67eGcKqJwLLKcyDQ'
  config.consumer_secret = 'cBV3hMvtPPQ6g9z3Wg0rMhYxDGU'
  config.token = 'tNDHJPu3ZBqgVqxSiwfYq2PGl6yzLSq8'
  config.token_secret = '-uclfOVidbO_nqReHUrxZjWxsro'
end
