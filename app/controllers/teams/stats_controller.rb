class Teams::StatsController < ApplicationController

  def index
    @team = Team.find(params[:id])
  end
end
