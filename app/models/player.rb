class Player < User
  has_many :team_players
  has_many :teams, through: :team_players
  has_many :team_coaches, through: :teams
  has_many :coaches, through: :team_coaches
  has_one :profile, class_name: :PlayerProfile
end
