class Api::V1::PlayerStatsController < ApplicationController
  def show
    byebug
    render json: PlayerStatsService.new(params[:id], params[:games]).stats_chart_data
  end
end
