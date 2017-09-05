require 'rails_helper'

RSpec.describe TeamPlayer, type: :model do
  it { should belong_to(:team) }
  it { should belong_to(:player) }
end
