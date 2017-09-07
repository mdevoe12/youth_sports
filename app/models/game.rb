class Game < ApplicationRecord
  belongs_to :facility
  has_many :game_teams
  has_many :teams, through: :game_teams
  enum status: [:complete, :upcoming]

  def facility_name
    self.facility.name
  end

  def lat
    self.facility.latitude
  end

  def lng
    self.facility.longitude
  end

  def address
    self.facility.address
  end

  def vs(player)
    self.teams.where.not(id: player.team.id)[0].name
  end

  def when
    self.date.strftime('%a, %b %e')
  end
end
