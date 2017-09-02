class Prospect < ApplicationRecord
  belongs_to :recruiter_profile
  belongs_to :player_profile

  def name
    self.player_profile.player.first_name + ' ' + self.player_profile.player.last_name
  end
end
