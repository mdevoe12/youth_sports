class Recruiters::ProfileController < ApplicationController
  def new
    @recruiter_id = params["recruiter_id"]
    @recruiter_profile = RecruiterProfile.new
  end
end
