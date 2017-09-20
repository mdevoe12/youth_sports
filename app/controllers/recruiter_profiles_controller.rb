class RecruiterProfilesController < ApplicationController
  before_action :player_check

  def new
    @recruiter_id = current_user.id
    @recruiter_profile = RecruiterProfile.new
  end

  def create
    @recruiter_profile = RecruiterProfile.create(recruiter_params)
    if @recruiter_profile.save
      redirect_to dashboard_index_path
    else
      flash[:message] = "There was an error processing your request; please try again"
      render :new
    end
  end

  def show
    @recruiter_profile = RecruiterProfile.find(params[:id])
    @images = Image.random_user
    @recruiter = @recruiter_profile.recruiter
    render 'public/404' if current_user.type == "Player"
  end

  def index
    @recruiter_profiles = RecruiterProfile.page(params[:page]).per(30)
  end


  private

  def recruiter_params
    params.require(:recruiter_profile).permit(:first_name, :last_name, :institution, :email, :phone_number, :recruiter_id)
  end

  def player_check
    redirect_to login_path if current_user.nil? || current_user.type == "Player"
  end

end
