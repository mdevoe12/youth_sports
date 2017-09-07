class CoachProfilesController < ApplicationController

  def show
    @coach_profile.find_by(params[:id])
  end

end
