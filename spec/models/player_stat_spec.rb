require 'rails_helper'

RSpec.describe PlayerStat, type: :model do
  it { should belong_to(:player_profile)}
end
