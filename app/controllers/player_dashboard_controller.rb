class PlayerDashboardController < ApplicationController
  def show
  end

  private

  def build_twitter_service
    @service ||= TwitterService.new(current_user)
  end

end
