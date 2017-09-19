class TypeSelectionController < ApplicationController

  def new
    @user = current_user
  end

  def create
    current_user.update_attributes!(type: params[:type])
    redirect_to new_player_profile_path if current_user.type == "Player"
    redirect_to new_recruiter_profile_path if current_user.type == "Recruiter"
    redirect_to new_coach_profile_path if current_user.type == "Coach"
  end

  private

  def user_params
    params.require(:users).permit(:type)
  end

end
