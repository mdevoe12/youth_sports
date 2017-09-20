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

  def edit
    @player_profile = PlayerProfile.find_by(player_id: current_user.id)
  end

  def update
    @player_profile = PlayerProfile.find_by(player_id: current_user.id)
    @player_profile.update(update_params)
    redirect_to dashboard_index_path
  end

  def show
    @player_profile = PlayerProfile.find(params[:id])
    @player = Player.find(@player_profile.player_id)
  end

  def index
    @player_profiles = PlayerProfile.all
  end

  private

  def profile_params
    params.require(:player_profile).permit(:school, :height, :weight, :grade_level,
    :gpa, :guardian_phone, :player_id)
  end

  def update_params
    params.require(:player_profile).permit(:school, :height, :weight, :grade_level, :guardian_phone)
  end
end
