class Point
  def initialize(player_stat)
    @points = player_stat.points
    @game = Game.find(player_stat.game_id)
    @facility = Facility.find(@game.facility_id)
  end

  def self.create_points(player_stat_array)
    player_stat_array.map do |player_stat|
      new(player_stat)
    end
  end
end
