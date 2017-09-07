class PlayerStatsService

  def initialize(id, number_of_games)
    player = Player.find(id)
    @player_stats = PlayerStat.player_stats(player, number_of_games)
    @json_return = {}
  end

  def stats_chart_data
    @player_stats.each do |stat, i|
      @json_return["0#{i}"] = stat.points
      byebug
    end
    @json_return
  end

end
