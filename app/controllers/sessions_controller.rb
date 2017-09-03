class SessionsController < ApplicationController
  def create
    @response = Faraday.get("https://graph.facebook.com/v2.10/oauth/access_token?client_id=#{ENV['FACEBOOK_APP_ID']}&redirect_uri=http://localhost:3000/auth/facebook/callback&client_secret=#{ENV['FACEBOOK_APP_SECRET']}&code=#{params["code"]}")

    token = @response.body.split(/\W+/)[2]

    oauth_response = Faraday.get("https://graph.facebook.com/debug_token?input_token=#{token}&access_token=#{ENV['FACEBOOK_APP_ID']}|#{ENV['FACEBOOK_APP_SECRET']}")

    auth = JSON.parse(oauth_response.body)
    user = User.find_or_create_by(uid: auth["data"]["user_id"])
    user.uid = auth["data"]["user_id"]
    user.provider = "facebook"
    user.type = "Player"
    user.save

    session[:user_id] = user.id

    redirect_to root_path

    ## Use this path once profile views exist
    # redirect_to "/users/players/:id/profile"
  end
end
