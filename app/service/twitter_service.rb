class TwitterService
  attr_reader :client

  def initialize(current_user)
    @connection ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_api_key']
      config.consumer_secret     = ENV['twitter_api_secret']
      config.access_token        = current_user.oauth_token
      config.access_token_secret = current_user.secret
    end
  end

  def user
    @connection.user
  end

  def tweets
    @connection.home_timeline
  end
  # def self.connection
  #   @_connection  = Faraday.new("https://api.twitter.com")
  # end

  def filter(user_screen_name)
    user_screen_name.tr('@', '')
  end


  def find_tweets_by_screen_name
    # screen_name = current_user.favorite_player.screen_name if current_user.favorite_player
    # return if screen_name.nil?
    # connection.get("/1.1/statuses/user_timeline.json?screen_name=#{filtered_screen_name}")
    # tweets = client.user_timeline(filtered_screen_name)
    binding.pry
  end

end
