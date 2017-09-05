class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      # redirect_to player_path(@player)
      redirect_to player_profile_path(@player)
      # binding.pry
    else
      render :new
    end
  end

  def index
  end

  def show
    @player = Player.find(params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:username, :first_name, :last_name, :password)
  end
end
