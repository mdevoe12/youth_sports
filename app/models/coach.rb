class Coach < User
  has_many :team_coaches
  has_many :teams, through: :team_coaches
  has_many :team_players, through: :teams
  has_many :players, through: :team_players
  has_one :profile, class_name: :CoachProfile
end
