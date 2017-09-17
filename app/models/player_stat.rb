class PlayerStat < ApplicationRecord
  belongs_to :player_profile
  belongs_to :game

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
    x = 10 if x.nil?
  end

  def self.player_total_points(player)
    PlayerStat.where(player_profile_id: player.profile.id).sum(:points)
  end

  def self.player_total_fouls(player)
    PlayerStat.where(player_profile_id: player.profile.id).sum(:fouls)
  end
end
