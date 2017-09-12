class FacebookController < ApplicationController
  skip_before_action :authorize!

  def new

  end

  def create
    user = User.create_with_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to dashboard_index_path
  end
end
