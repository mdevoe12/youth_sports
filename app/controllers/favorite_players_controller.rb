class FavoritePlayersController < ApplicationController

  def new
    @favorite_player = FavoritePlayer.new
  end

  def create
    fav = params["favorite_player"]["screen_name"]
    @favorite_player = FavoritePlayer
                    .create(screen_name: fav, player_id: current_user.id)
    # @favorite_player = current_user.create_favorite_player(screen_name: fav)
    redirect_to player_profiles_path(current_user.id)
  end

end
