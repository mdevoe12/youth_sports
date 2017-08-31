class TeamCoach < ApplicationRecord
  belongs_to :team
  belongs_to :coach
end
