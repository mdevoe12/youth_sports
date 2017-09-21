require 'rails_helper'

RSpec.describe Game, type: :model do
  before :each do
    @game = create(:game, :with_teams)
    @facility = create(:facility)
  end

  it { should belong_to(:facility) }
  it { should have_many(:game_teams) }
  it { should have_many(:teams).through(:game_teams) }

  it do
    should define_enum_for(:status).
      with([:complete, :upcoming])
  end

  describe ".facility_name" do
    it "returns the name of a facility" do

      expect(@game.facility_name).to eq(@facility.name)
    end
  end

  describe ".lat" do
    it "returns the latitude for a facility where a game is being played" do

      expect(@game.lat).to eq(@facility.latitude)
    end
  end

  describe ".lng" do
    it "returns the longitude for a facility where a game is being played" do

      expect(@game.lng).to eq(@facility.longitude)
    end
  end

  describe ".address" do
    it "returns the address for a facility where a game is being played" do

      expect(@game.address).to eq(@facility.address)
    end
  end

  describe ".vs(player)" do
    it "returns the name of the team that is being played against" do
      player = create(:team_player)

      expect(@game.vs(player)).not_to eq(player.team.name)
    end
  end

  describe ".when" do
    it "returns the date for a a game" do

      expect(@game.when).to eq(@game.date.strftime('%a, %b %e'))
    end
  end
end
