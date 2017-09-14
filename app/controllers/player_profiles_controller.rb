class PlayerProfilesController < ApplicationController

  def new
    @player_id = params["player_id"]
    @player_profile = PlayerProfile.new
  end

  def create
    @player_profile = PlayerProfile.new(profile_params)
    if @player_profile.save
      redirect_to player_profile_path(@player_profile.id)
    end
  end

  def show
    @player_profile = PlayerProfile.find(params[:id])
    # if current_user.type == "Recruiter"
      # @player = current_user.prospects.find_by(player_profile_id: params[:id]).player_profile.player
    # else
      @player = Player.find(@player_profile.player_id)
    # end
  end

  def index
    @player_profiles = PlayerProfile.page(params[:page]).per(9)
  end

  private

  def profile_params
    params.require(:player_profile).permit(:school, :height, :weight, :grade_level,
    :gpa, :guardian_phone, :player_id)
  end
end
