class Player < User

  belongs_to :team
  has_many :coaches, through: :team
  has_one :profile, class_name: :PlayerProfile
  
end
