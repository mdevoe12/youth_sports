class Api::V1::PlayerPointsController < ApplicationController
  skip_before_action :authorize!

  def show
    player = Player.find(params[:id])
    render json: Point.create_points(player.stats)
  end
end
