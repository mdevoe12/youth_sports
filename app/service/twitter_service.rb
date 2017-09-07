class TwitterService

  def initialize(current_user)
    @_connection = Faraday.new("https://api.twitter.com")
      # client = Twitter::REST::Client.new do |config|
      # config.consumer_key        = "7YCenEuO8H8NzbpauJo168j66"
      # config.consumer_secret     = "F8WAEHiSSno6bz9tYTGzhYQGFfABthyDrWKoONoiJybXmjHs5s"
      # config.access_token        = current_user.oauth_token
      # config.access_token_secret = current_user.secret
    # end
  end

  def self.find_tweets_by_screen_name(user_screen_name)
    lebron = client.user_timeline(user_screen_name)
    binding.pry
  end

  def self.from_omniauth(auth_info)
  end

end
