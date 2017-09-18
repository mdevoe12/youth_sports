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
  end

  def index
    @coach_profiles = CoachProfile.all
  end

  private

  def coach_params
    params.require(:coach_profile).permit(:institution, :email, :phone_number, :coach_id)
  end

  def player_check
    render file: 'public/404.html', layout: true, status: 404 if current_user.type == "Player"
  end

end
