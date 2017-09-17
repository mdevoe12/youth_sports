class Recruiter < User
  has_one :profile, class_name: :RecruiterProfile
  has_many :prospects, through: :profile


  def name
    self.first_name + " " + self.last_name
  end
end
