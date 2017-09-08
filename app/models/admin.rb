class Admin < User
  has_secure_password
  has_one :profile, class_name: :AdminProfile
end
