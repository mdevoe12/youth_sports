class PlayerStatsService

  def initialize(id, number_of_games)
    @player = Player.find(id)
    @player_stats = PlayerStat.player_stats(@player, number_of_games)
    @json_return = {}
  end

  def stats_chart_data
    points = @player_stats.map{|stat| stat.points}.reverse!
    fouls = @player_stats.map{|stat| stat.fouls}.reverse!
    name = @player.name
    @json_return[:name] = name
    @json_return[:points] = Hash[(1..@player_stats.size).zip points]
    @json_return[:fouls] = Hash[(1..@player_stats.size).zip fouls]
    @json_return
  end
end
