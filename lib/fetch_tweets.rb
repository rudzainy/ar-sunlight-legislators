require_relative '../app/models/legislator'
require_relative '../app/models/rep'
require_relative '../app/models/sen'
require_relative '../app/models/del'
require_relative '../app/models/com'
require_relative '../app/models/tweet'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "6bMMl7UDOTjvq6Vfjnyd0j1Bo"
  config.consumer_secret     = "XgUXpZvNw0fjJhiGWHGMoGIg945KrPTDyQzOUq6kcjtyGcEzll"
  config.access_token        = "612492229-kC4Q3YxNW13T9MpKM9E5P09eXvJHomEfLJ0aivM5"
  config.access_token_secret = "IZquwL9qepLAvOBwuvYPfkNyuwWrQ2yj8omfR5PluwQk4"
end

legislators = Legislator.where(twitter_id: "RepAndrews") # change to .all when ready

i = 0
legislators.each do |legislator|
  unless (legislator.twitter_id).nil?
    # delete old tweets
    old_tweets = Tweet.where(legislator_id: legislator.id)
    old_tweets.destroy_all

    # fetch new tweets
    client.search("from:#{legislator.twitter_id}", result_type: "recent").take(10).each do |tweet|
      Tweet.create(id: tweet.id, legislator_id: legislator.id, text: tweet.text)
    end
  end
  p i += 1
end