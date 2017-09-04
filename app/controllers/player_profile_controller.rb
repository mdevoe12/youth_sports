class PlayerProfileController < ApplicationController
  def show
    # require "pry"; binding.pry
    if current_user.type == "Recruiter"
      @player = current_user.prospects.find_by(player_profile_id: params[:id]).player_profile.player
    else
    end
  end
end
