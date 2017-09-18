class FavoritePlayersController < ApplicationController

  def new
    @favorite_player = FavoritePlayer.new
  end

  def create
    fav = params["favorite_player"]["screen_name"]
    @favorite_player = FavoritePlayer
                        .create(screen_name: fav, player_id: current_user.id)
    player_name = build_twitter_service.fav_player_name
    @favorite_player.update(full_name: player_name)
    redirect_to dashboard_index_path(current_user.id)
  end

  private

  def build_twitter_service
    @service ||= TwitterService.new(current_user)
  end

end
