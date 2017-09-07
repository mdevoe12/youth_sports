class FavoritePlayerController < ApplicationController

  def new
    @favorite_player = FavoritePlayer.new
  end

  def create
  end

end
