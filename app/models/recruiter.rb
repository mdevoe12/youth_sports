class Recruiter < User
  has_secure_password
  has_one :profile, class_name: :RecruiterProfile
end
