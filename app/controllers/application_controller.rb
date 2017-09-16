class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  helper_method :current_user
  alias_method :devise_current_user, :current_user

  def current_user
    if session[:user_id] != nil
      @current_user ||= User.find(session[:user_id])
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  private

  # def authorize!
  #   render file: 'public/404.html', layout: true, status: 404 if current_user.nil?
  # end

end
