class Profiles::PlayerProfilesController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end

end
