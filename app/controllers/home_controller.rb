class HomeController < ApplicationController

  skip_before_action :authorize!, only: [:index]


  def index
    
  end

  private

  def build_twitter_service
    @service ||= TwitterService.new(current_user)
  end

end
