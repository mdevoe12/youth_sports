class Player < User
  
  has_one :profile, class_name: :PlayerProfile
  
end
