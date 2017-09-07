class Api::V1::PlayerStatsController < ApplicationController
  def show
    x = params[:games]
    player = Player.find(params[:id])
    render json: PlayerStat.player_stats(player, x)
  end
end
