class Game < ApplicationRecord
  belongs_to :facility
  has_many :game_teams
  has_many :teams, through: :game_teams
  has_many :player_stats 
  enum status: [:complete, :upcoming]

  def facility_name
    self.facility.name
  end

  def coords
    { lat: self.facility.latitude,
      lng: self.facility.longitude }
  end
end
