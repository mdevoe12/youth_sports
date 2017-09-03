class Prospect < ApplicationRecord
  belongs_to :recruiter_profile
  belongs_to :player_profile

  enum status: %w(open in-progress denied prospect)
end
