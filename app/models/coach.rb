class Coach < User
  has_many :team_coaches
  has_many :teams, through: :team_coaches
  has_many :team_players, through: :teams
  has_many :players, through: :team_players
  has_one :profile, class_name: :CoachProfile

  def name
    self.last_name + ", " + self.first_name
  end

  def team
    if self.teams.count == 1
      self.teams.first
    else
    end
  end

  def team_names
    self.teams.pluck(:name)
  end

end
