class Teams::StatsController < ApplicationController

  skip_before_action :authorize!, only: [:index]

  def index
    @team = Team.find(params[:id])
  end
end
