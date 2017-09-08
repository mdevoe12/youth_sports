class Api::V1::PlayerGamesController < ApplicationController
  skip_before_action :authorize!

  def show
    render json: PlayerGamesService.new(params[:id]).upcoming_games
  end
end
