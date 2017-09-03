class PlayerProfileController < ApplicationController
  def show
# require "pry"; binding.pry
  @player = current_user.prospects.find(params[:format]).player_profile.player
  end
end
