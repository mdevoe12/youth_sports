class Coach < User
  has_secure_password
  belongs_to :team
  has_many :players, through: :team
  has_one :profile, class_name: :CoachProfile

end
