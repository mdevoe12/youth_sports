require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many(:team_coaches) }
  it { should have_many(:coaches).through(:team_coaches) }
  it { should have_many(:team_players) }
  it { should have_many(:players).through(:team_players) }
  it { should have_many(:game_teams) }
  it { should have_many(:games).through(:game_teams) }
end
