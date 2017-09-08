class SessionsController < ApplicationController


  skip_before_action :authorize!, only: [:new, :create, :destroy]


  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
      # if user.type == "Player"
      #   redirect_to player_profile_path(user.id)
      # elsif user.type == "Recruiter"
      #   redirect_to recruiter_profile_path(user.id)
      # else user.type == "Coach"
      #   redirect_to coach_profile_path(user.id)
      # end
    else
      flash[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end

# if params[:oauth_token]
#   twitter = request.env['omniauth.auth']
#   player = Player.find_or_create_from_twitter_auth(twitter)
#     player.save
#     session[:user_id] = player.id
#     redirect_to player_dashboard_path(player)
# else
# @response = Faraday.get("https://graph.facebook.com/v2.10/oauth/access_token?client_id=#{ENV['FACEBOOK_APP_ID']}&redirect_uri=http://localhost:3000/auth/facebook/callback&client_secret=#{ENV['FACEBOOK_APP_SECRET']}&code=#{params["code"]}")
# token = @response.body.split(/\W+/)[2]
# oauth_response = Faraday.get("https://graph.facebook.com/debug_token?input_token=#{token}&access_token=#{ENV['FACEBOOK_APP_ID']}|#{ENV['FACEBOOK_APP_SECRET']}")
# auth = JSON.parse(oauth_response.body)
# user = User.find_or_create_by(uid: auth["data"]["user_id"])
# user.uid = auth["data"]["user_id"]
# user.provider = "facebook"
# user.type = "Player"
# user.save
