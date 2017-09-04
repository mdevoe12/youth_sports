class Game < ApplicationRecord
  belongs_to :facility
  has_many :game_teams
  has_many :teams, through: :game_teams
  enum status: [:complete, :upcoming]

  def facility_name
    self.facility.name
  end
end
