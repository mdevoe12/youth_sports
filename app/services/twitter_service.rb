class TwitterService
  attr_reader :client

  def initialize(current_user)
    @connection ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_api_key']
      config.consumer_secret     = ENV['twitter_api_secret']
      config.access_token        = current_user.oauth_token
      config.access_token_secret = current_user.secret
    @current_user = current_user
    end
  end

  def fav_player_tweets
    @connection.user_timeline(@current_user.favorite_player.screen_name, count: 20, exclude_replies: true)
  end

  def filter(user_screen_name)
    user_screen_name.tr('@', '')
  end
end
