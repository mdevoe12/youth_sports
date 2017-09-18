class FavoritePlayerStats
  attr_reader :plus_minus

  def initialize(data)
    stats = data["cumulativeplayerstats"]["playerstatsentry"][0]["stats"]
    @plus_minus = stats["PlusMinusPerGame"]["#text"]
  end
end
