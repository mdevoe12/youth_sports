class SessionsController < ApplicationController
  def create
    # @twitter_response = Faraday.get("https://api.twitter.com/1.1/users/show.json")
    twitter = request.env['omniauth.auth']
    if player = Player.find_or_create_from_twitter_auth(twitter)
      session[:user_id] = player.id
      redirect_to root_path
    end




    # twitter_user = Player.find_or_create_from_twitter_auth(twitter_auth)
    # raise :test
    # self.current_user = @twitter_user
    # session[:user_id] = twitter_user.id
    # redirect_to player_dashboard_path(twitter_user.id)


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

    # redirect_to root_path

  end

  private

  def twitter_auth
    request.env['omniauth.auth']
  end

end
