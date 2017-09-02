class PlayerStat < ApplicationRecord
  belongs_to :player_profile

  def stat_dates
    self.created_at.strftime('%b-%d, %Y')
  end
end
