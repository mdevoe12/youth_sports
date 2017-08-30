class Coach < ApplicationRecord
  belongs_to :team
  has_many :players, through: :team
end
