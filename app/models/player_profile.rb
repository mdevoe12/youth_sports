class PlayerProfile < ApplicationRecord
  belongs_to :player
  has_many :prospects
end
