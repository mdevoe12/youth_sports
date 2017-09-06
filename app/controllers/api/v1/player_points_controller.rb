class Api::V1::PlayerPointsController < ApplicationController
  def show
    render json: Points.new(PlayerStat)
  end
end
