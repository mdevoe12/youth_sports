class Team < ApplicationRecord
  has_many :team_coaches
  has_many :coaches, through: :team_coaches
  has_many :team_players
  has_many :players, through: :team_players
  has_many :game_teams
  has_many :games, through: :game_teams


  def total_points
    players.map do |player|
      points =+ player.player_stats[0].points
    end.sum
  end

  def total_fouls
    players.map do |player|
      fouls =+ player.player_stats[0].fouls
    end.sum
  end
end
