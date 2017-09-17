class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  alias_method :devise_current_user, :current_user
  helper_method :current_user

  def current_user
    if session[:user_id] != nil
      @current_user ||= User.find(session[:user_id])
    end
  end

  def after_sign_in_path_for(user)
    if current_user.nil?
      login_path
    elsif current_user.type.nil?
      new_type_selection_path
    elsif current_user.profile.nil?
      if current_user.type == "Player"
        new_player_profile_path
      elsif current_user.type == "Coach"
        new_coach_profile_path
      elsif current_user.type == "Recruiter"
        new_recruiter_profile_path
      end
    end
  end

end
