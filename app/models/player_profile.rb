class PlayerProfile < ApplicationRecord
  belongs_to :player
  # delegate :profile, :to => :user
end
