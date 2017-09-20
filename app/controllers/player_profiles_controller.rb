class PlayerProfilesController < ApplicationController

  def new
    @player_id = current_user.id
    @player_profile = PlayerProfile.new
  end

  def create
    @player_profile = PlayerProfile.new(profile_params)
    if @player_profile.save!
      redirect_to dashboard_index_path
    else
      flash[:message] = "There was an error processing your request; please try again"
      render :new
    end
  end

  def edit
    @player_profile = PlayerProfile.find_by(player_id: current_user.id)
    @player_id = @player_profile.player_id
  end

  def update
    @player_profile = PlayerProfile.find_by(player_id: current_user.id)
    if @player_profile.update(profile_params)
      redirect_to dashboard_index_path
    else
      flash[:message] = "error"
    end
  end

  def show
    redirect_to login_path unless user_signed_in?
    @player_profile = PlayerProfile.find(params[:id])
    @player = Player.find(@player_profile.player_id)
    if @player.hot?
      @hot = true
    else
      @hot = false
    end
  end

  def index
    @search = PlayerProfile.search(params[:q])
    @player_profiles = @search.result.includes(:player).page(params[:page]).per(16)
  end

  private

  def profile_params
    params.require(:player_profile).permit(:first_name, :last_name, :school, :height, :weight, :grade_level,
    :gpa, :guardian_phone, :player_id)
  end

  def update_params
    params.require(:player_profile).permit(:school, :height, :weight, :grade_level, :guardian_phone, :player_id)
  end
end
