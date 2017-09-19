class Recruiter < User
  has_one :profile, class_name: :RecruiterProfile
  has_many :prospects, through: :profile

  def name
    if self.first_name.nil? || self.last_name.nil?
      self.profile.first_name + " " + self.profile.last_name
    else
      self.first_name + " " + self.last_name
    end
  end
end
