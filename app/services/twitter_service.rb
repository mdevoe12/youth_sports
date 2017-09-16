class TwitterService

  def initialize(current_user)
    @connection ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_api_key']
      config.consumer_secret     = ENV['twitter_api_secret']
    @current_user = current_user
    end
  end

  def fav_player_tweets
    @connection.user_timeline(@current_user.favorite_player.screen_name, count: 20, exclude_replies: true)
  end

end
