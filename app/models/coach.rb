class Coach < User

  belongs_to :team
  has_many :players, through: :team
  has_one :profile, class_name: :CoachProfile

end
