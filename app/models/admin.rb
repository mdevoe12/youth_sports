class Admin < User
  has_one :profile, class_name: :AdminProfile
end
