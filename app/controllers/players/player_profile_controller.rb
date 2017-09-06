class PlayerProfileController < ApplicationController

  def new
    @player_id = params["player_id"]
    @player_profile = PlayerProfile.new
  end

  def create
    byebug
  end  

  def show
    @player_profile.find_by(params[:id])
    if current_user.type == "Recruiter"
      @player = current_user.prospects.find_by(player_profile_id: params[:id]).player_profile.player
    else
    end
  end

end
