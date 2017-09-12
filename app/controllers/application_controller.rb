class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authorize!

  def current_user
    if session[:user_id] != nil
      @current_user ||= User.find(session[:user_id])
    end
  end

  private

  def authorize!
    # render file: 'public/404.html', layout: true, status: 404 if current_user.nil?
  end

end
