class Recruiter < User
  has_one :profile, class_name: :RecruiterProfile
end
