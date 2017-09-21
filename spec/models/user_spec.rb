require 'rails_helper'

RSpec.describe User, type: :model do

  describe "associations" do
    it { should have_many(:authentications) }
  end

  describe "valid player" do
    it "has a valid type" do
      player = create(:user)
      player.type = Player.types[1]
      expect(player).to be_valid
      expect(player.type).not_to eq("Admin")
    end
  end
end
