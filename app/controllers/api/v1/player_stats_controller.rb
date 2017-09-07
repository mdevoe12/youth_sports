class Api::V1::PlayerStatsController < ApplicationController
  def show
    if params[:id].nil?
      render file: 'public/404' if params[:id].nil?
    else
      render json: PlayerStatsService.new(params[:id], params[:games]).stats_chart_data
    end
  end
end
