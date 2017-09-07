class HomeController < ApplicationController

  def index
    # tweet_info = build_twitter_service
    # @user = tweet_info.user
    # @tweets = tweet_info.find_tweets_by_screen_name("@KingJames")
  end

  private

  def build_twitter_service
    @service ||= TwitterService.new(current_user)
  end

end
