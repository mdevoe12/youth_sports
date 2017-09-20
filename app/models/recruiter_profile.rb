class RecruiterProfile < ApplicationRecord
  belongs_to :recruiter
  has_many :prospects
  has_many :player_profiles, through: :prospects
end
