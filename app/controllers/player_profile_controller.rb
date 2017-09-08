class PlayerProfileController < ApplicationController
  def show
    @player_profile.find_by(params[:id])
  end
end
