class FavoritePlayerStats
  attr_reader :plus_minus

  def initialize(data)
    if data["cumulativeplayerstats"]["playerstatsentry"] != nil
      stats = data["cumulativeplayerstats"]["playerstatsentry"][0]["stats"]
      @plus_minus = stats["PlusMinusPerGame"]["#text"]
    else
      @plus_minus = "not a basketball player"
    end
  end
end
