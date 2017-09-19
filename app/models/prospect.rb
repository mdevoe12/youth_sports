class Prospect < ApplicationRecord
  belongs_to :recruiter_profile
  belongs_to :player_profile

  enum status: %w(in-progress denied prospect open watching)

  def name
    self.player_profile.player.first_name + ' ' + self.player_profile.player.last_name
  end

  def self.find_player_prospect(body)
    response = body.split
    player_prospect = (Prospect.find_by(token: response[0]))
    player_prospect.update_prospect(response, player_prospect)
  end

  def update_prospect(response, player_prospect)
    if response[1] == "yes"
      player_prospect.update(status: "prospect")
    elsif response[1] == "no"
      player_prospect.update(status: "denied")
    end
  end

end
