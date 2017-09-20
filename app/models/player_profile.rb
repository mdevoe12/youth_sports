class PlayerProfile < ApplicationRecord
  belongs_to :player
  has_many :prospects
  has_many :recruiter_profiles, through: :prospects
  has_many :player_stats

  enum status: ["active", "inactive"]

  ransack_alias :player, :player_first_name_or_player_last_name

end
