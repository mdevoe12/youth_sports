class Recruiter < User
  has_one :profile, class_name: :RecruiterProfile
  has_many :prospects, through: :profile
end
