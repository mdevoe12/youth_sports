class Team < ApplicationRecord
  has_many :players
  has_many :coaches 
end
