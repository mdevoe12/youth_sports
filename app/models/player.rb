class Player < User
  belongs_to :team
  has_many :coaches, through: :team
end
