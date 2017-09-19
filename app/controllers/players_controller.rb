class PlayersController < ApplicationController

  def new
    @response = Faraday.get("https://graph.facebook.com/v2.10/oauth/access_token?client_id=#{ENV['FACEBOOK_APP_ID']}&redirect_uri=http://localhost:3000/players/new&client_secret=#{ENV['FACEBOOK_APP_SECRET']}&code=#{params["code"]}")
    token = @response.body.split(/\W+/)[2]

    oauth_response = Faraday.get("https://graph.facebook.com/debug_token?input_token=#{token}&access_token=#{ENV['FACEBOOK_APP_ID']}|#{ENV['FACEBOOK_APP_SECRET']}")

    auth = JSON.parse(oauth_response.body)
    @uid = auth["data"]["user_id"]
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      session[:user_id] = @player.id
      redirect_to controller: 'player_profiles', action: 'new', player_id: @player.id
    else
      render :new
    end
  end

  def index
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    render file: 'public/404' unless current_user.id == params[:id].to_i
    @player_profile = PlayerProfile.find_by(player_id: params[:id])
  end

  def update
    player_profile = PlayerProfile.find(params[:id])
    player_profile.update(update_params)
    @player = Player.find(player_profile.player_id)
    redirect_to "/player_profiles/#{@player.profile.id}"
  end

  private

    def player_params
     params.require(:player).permit(:username, :first_name, :last_name, :password, :uid)
    end

    def update_params
      params.require("player_profile").permit(:school, :height, :weight, :grade_level, :gpa, :guardian_phone)
    end
end
