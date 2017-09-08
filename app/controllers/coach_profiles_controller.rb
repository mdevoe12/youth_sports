class CoachProfilesController < ApplicationController

  def show
    @coach_profile.find_by(params[:id])
  end

  def index
    @coach_profiles = CoachProfile.all
  end

end
