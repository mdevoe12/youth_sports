class Recruiter < User
  has_one :profile, class_name: :RecruiterProfile
  has_many :prospects, through: :profile


  def name
    self.profile.first_name + " " + self.profile.last_name
  end
end
