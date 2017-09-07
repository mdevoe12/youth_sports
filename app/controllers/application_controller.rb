class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id] != nil
      @current_user ||= User.find(session[:user_id])
    end
  end

  private

  def authorize
    raise ActionController::RoutingError.new('Not Found') if current_user.nil?
  end

end
