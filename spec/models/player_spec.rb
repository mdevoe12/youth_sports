require 'rails_helper'

RSpec.describe Player, type: :model do

  before :each do
    @player = create(:player, :with_profile)
    game    = create(:game)
    team    = create(:team)
              create(:team_player, player_id: @player.id, team_id: team.id)
              create(:game_team, game_id: game.id, team_id: team.id)
              create(:player_stat, player_profile_id: @player.profile.id, game_id: game.id)
  end

  describe "associations" do
    it { should have_many(:team_players) }
    it { should have_many(:teams) }
    it { should have_many(:team_coaches) }
    it { should have_many(:coaches).through(:team_coaches) }
    it { should have_one(:profile) }
    it { should have_many(:player_stats) }
    it { should have_one(:favorite_player) }
  end

  describe ".name" do
    it "returns the full name of a player" do

      expect(@player.name).to eq("#{@player.first_name}" +" " + "#{@player.last_name}")
    end
  end

  describe ".school" do
    it "returns the name of a player's school from their profile" do

      expect(@player.school).to eq(@player.profile.school)
    end
  end

  describe ".height" do
    it "returns the height of a player from their profile" do

      expect(@player.height).to eq(@player.profile.height)
    end
  end

  describe ".weight" do
    it "returns the weight of a player from their profile" do

      expect(@player.weight).to eq(@player.profile.weight)
    end
  end

  describe ".grade" do
    it "returns the grade of a player from their profile" do

      expect(@player.grade).to eq(@player.profile.grade_level)
    end
  end

  describe ".gpa" do
    it "returns the grade of a player from their profile" do

      expect(@player.gpa).to eq(@player.profile.gpa)
    end
  end

  describe ".guardian_phone" do
    it "returns the guardian phone number of a player from their profile" do

      expect(@player.guardian_phone).to eq(@player.profile.guardian_phone)
    end
  end

  describe ".stats" do
    it "returns the stats for a player from their profile" do

      expect(@player.stats).to eq(@player.profile.player_stats)
    end
  end

  describe ".team" do
    it "returns the first team that a player belongs to" do

      expect(@player.team).to eq(@player.teams.first)
    end
  end

  describe ".upcoming" do
    it "returns upcoming game for a player" do

      expect(@player.upcoming).to eq(@player.team.games.where(status: "upcoming"))
    end
  end
end
