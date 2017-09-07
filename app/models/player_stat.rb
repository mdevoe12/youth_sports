class PlayerStat < ApplicationRecord
  belongs_to :player_profile

  def stat_dates
    self.created_at.strftime('%b-%d, %Y')
  end

  def self.player_stats(player, x = 10)
    x = create_limit(x)
    PlayerStat.where(player_profile_id: player.profile.id)
    .order(created_at: :DESC)
    .limit(x)
  end

  def self.create_limit(x)
    if x == nil
      x = 10
    else
      x = x
    end
  end
end
