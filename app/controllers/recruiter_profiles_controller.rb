class RecruiterProfilesController < ApplicationController
  def new
    @recruiter_id = params["recruiter_id"]
    @recruiter_profile = RecruiterProfile.new
  end

  def create
    @recruiter_profile = RecruiterProfile.create(recruiter_params)
    if @recruiter_profile.save
      redirect_to recruiter_profile_path(@recruiter_profile.id)
    end
  end

  def show
    @recruiter_profile = RecruiterProfile.find(params[:id])
    @recruiter = Recruiter.find(@recruiter_profile.recruiter_id)
    if current_user.type == "Player"
      @recruiter = current_user.prospects.find_by(recruiter_profile_id: params[:id]).recruiter_profile.recruiter
    else
    end
  end
end

private

def recruiter_params
  params.require(:recruiter_profile).permit(:institution, :email, :phone_number, :uid, :recruiter_id)
end
