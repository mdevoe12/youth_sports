class PlayerDashboardController < ApplicationController
  def show
    # @tweet_info = build_twitter_service
    # @user = tweet_info.user
    # @current_user = current_user.favorite_player
    # @tweets = tweet_info.find_tweets_by_screen_name("@KingJames")
  end

  private

  def build_twitter_service
    @service ||= TwitterService.new(current_user)
  end

end
