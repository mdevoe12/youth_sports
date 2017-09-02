class PlayerProfile < ApplicationRecord
  belongs_to :player
  has_many :prospects
  has_many :player_stats
end
