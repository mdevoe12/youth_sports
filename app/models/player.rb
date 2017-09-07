class Player < User
  has_many :team_players
  has_many :teams, through: :team_players
  has_many :team_coaches, through: :teams
  has_many :coaches, through: :team_coaches
  has_one :profile, class_name: :PlayerProfile
  has_many :player_stats, through: :profile



  def name
    self.first_name + " " + self.last_name
  end

  def school
    self.profile.school
  end

  def height
    self.profile.height
  end

  def weight
    self.profile.weight
  end

  def grade
    self.profile.grade_level
  end

  def gpa
    self.profile.gpa
  end

  def stats
    self.player_stats
  end

  def points(x = 10)
    Hash[self.stats.map{|stat| stat.stat_dates + "(game:#{stat.id})"}.zip(self.stats.pluck(:points))].to_a.reverse[0..x-1]
  end

  def fouls(x = 10)
    Hash[self.stats.map{|stat| stat.stat_dates + "(game:#{stat.id})"}.zip(self.stats.pluck(:fouls))].to_a.reverse[0..x-1]
  end

  def team
    if self.teams.count == 1
      self.teams.first
    end
  end

  def upcoming
    self.team.games.where(status: "upcoming")
  end
end
