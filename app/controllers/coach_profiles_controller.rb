class CoachProfilesController < ApplicationController

  def show
    @coach_profile = CoachProfile.find(params[:id])
  end

  def index
    @coach_profiles = CoachProfile.all
  end

end
