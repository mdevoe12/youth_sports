class SessionsController < ApplicationController

  def new
    render 'devise/sessions/new'
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user.valid_password?(params[:session][:password])
      sign_in(user)
      session[:user_id] = user.id
      redirect_to dashboard_index_path unless user.type.nil?
      redirect_to new_type_selection_path if user.type.nil?
    else
      flash[:message] = "Username/password invalid, try again"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Logged out!'
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
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
