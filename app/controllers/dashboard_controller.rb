class DashboardController < ApplicationController

  def index
    redirect_to login_path if current_user.nil?

    @tweet_info = build_twitter_service
  end

  private

  def build_twitter_service
    @service ||= TwitterService.new(current_user)
  end
end
