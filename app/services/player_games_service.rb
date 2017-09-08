class PlayerGamesService
  def initialize(id)
    @player = Player.find(id)
    @upcoming = @player.teams.to_a.map{|team|team.games.where(status:'upcoming')}.flatten
    @json_return = []
  end

  def upcoming_games
    @json_return = UpcomingGames.build_ajax(@upcoming)
    @json_return
  end
end
