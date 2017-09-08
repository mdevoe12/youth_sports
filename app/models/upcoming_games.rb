class UpcomingGames
  def initialize(games)
    @games = games
  end

  def self.build_ajax(games)
    new(games).build_ajax
  end

  def build_ajax
    array = []
    i = 1
    @games.map do |game|
      array << [
                game.facility.name,
                game.facility.latitude,
                game.facility.longitude,
                i
                ]
      i += 1
    end
    array
  end
end
