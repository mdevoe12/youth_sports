class DashboardController < ApplicationController

  def index
    @tweet_info = build_twitter_service
  end

  private

  def build_twitter_service
    @service ||= TwitterService.new(current_user)
  end

end
