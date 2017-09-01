class Teams::StatsController < ApplicationController

  def index
    binding.pry
    @team = Team.find(params[:id])
  end

end
