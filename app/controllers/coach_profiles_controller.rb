class CoachProfilesController < ApplicationController

  def show
    @coach_profile = CoachProfile.find(params[:id])
    @images = Image.random_user
  end

  def index
    @coach_profiles = CoachProfile.page(params[:page]).per(30)
  end

end
