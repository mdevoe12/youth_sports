class Coach < User

  belongs_to :team
  has_many :players, through: :team
  has_one :coach_profile

end
