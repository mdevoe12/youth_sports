class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_profile_path(@player)
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
    player_profile = PlayerProfile.find(params[:format])
    player_profile.update(update_params)
    @player = Player.find(player_profile.player_id)
    redirect_to player_path(@player)
  end

  private
  
    def player_params
     params.require(:player).permit(:username, :first_name, :last_name, :password)
    end

    def update_params
      params.require("player_profile").permit(:school, :height, :weight, :grade_level, :gpa, :guardian_phone)
    end
end
