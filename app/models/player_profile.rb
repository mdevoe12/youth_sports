class PlayerProfile < ApplicationRecord
  belongs_to :player
  has_many :prospects
  has_many :recruiter_profiles, through: :prospects
  has_many :player_stats

  ransacker :grade_level do
    Arel.sql("to_char(grade_level, '9999999')")
  end
end
