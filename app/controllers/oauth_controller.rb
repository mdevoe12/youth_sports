class OauthController < ApplicationController
  skip_before_action :authorize!

  def new

  end

  def create
    auth = request.env['omniauth.auth']
    user = User.create_with_twitter(auth) if auth.provider == "twitter"
    user = User.create_with_facebook(auth) if auth.provider == "facebook"
    session[:user_id] = user.id
    redirect_to dashboard_index_path
  end
end
