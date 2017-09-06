class PlayerProfile < ApplicationRecord
  belongs_to :player
  has_many :prospects
  has_many :recruiter_profiles, through: :prospects
  has_many :player_stats
end
