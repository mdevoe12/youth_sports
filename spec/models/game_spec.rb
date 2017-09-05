require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should belong_to(:facility) }
  it { should have_many(:game_teams) }
  it { should have_many(:teams).through(:game_teams) }
end
