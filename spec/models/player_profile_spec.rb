require 'rails_helper'

RSpec.describe PlayerProfile, type: :model do
  it { should belong_to(:player) }
  it { should have_many(:prospects)}
  it { should have_many(:player_stats)}
end
