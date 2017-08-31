class Coach < User
  belongs_to :team
  has_many :players, through: :team
end
