require 'rails_helper'

RSpec.describe GameTeam, type: :model do
  it { should belong_to(:game)}
  it { should belong_to(:team)}
end
