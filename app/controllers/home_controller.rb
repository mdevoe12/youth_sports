class HomeController < ApplicationController

  def index
  end

  private

  def build_twitter_service
    @service ||= TwitterService.new(current_user)
  end

end
