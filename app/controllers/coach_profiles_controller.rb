class CoachProfilesController < ApplicationController
  before_action :player_check

  def new
    @coach_id = current_user.id
    @coach_profile = CoachProfile.new
  end

  def create
    @coach_profile = CoachProfile.create(coach_params)
    if @coach_profile.save
      redirect_to dashboard_index_path
    else
      flash[:message] = "There was an error processing your request; please try again"
      render :new
    end
  end

  def show
    @coach_profile = CoachProfile.find(params[:id])
    @images = Image.random_user
  end

  def index
    @coach_profiles = CoachProfile.page(params[:page]).per(30)
  end

  private

  def coach_params
    params.require(:coach_profile).permit(:first_name, :last_name, :institution, :email, :phone_number, :coach_id)
  end

  def player_check
    redirect_to login_path if current_user.nil? || current_user.type == "Player"
  end

end
