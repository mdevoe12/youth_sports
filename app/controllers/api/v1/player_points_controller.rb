class Api::V1::PlayerPointsController < ApplicationController
  def show
    @player = Player.find(params[:id])
    render json: Point.create_points(player.stats)
  end
end
