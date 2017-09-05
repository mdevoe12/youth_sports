class PlayerProfileController < ApplicationController
  def show
    binding.pry
    @player_profile.find_by(params[:id])
  end
end
