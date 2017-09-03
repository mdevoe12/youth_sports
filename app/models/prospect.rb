class Prospect < ApplicationRecord
  belongs_to :recruiter_profile
  belongs_to :player_profile

  enum status: %w(in-progress denied prospect open)
end
