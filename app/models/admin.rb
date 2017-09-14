class Admin < User
  has_secure_password
  has_one :profile, class_name: :AdminProfile
  has_one :favorite_player, class_name: :FavoritePlayer
end
