require 'rails_helper'

RSpec.describe 'A logged in recruiter clicks on a player name' do
  scenario 'and sees that players profile page with map and list of upcoming games' do
    VCR.use_cassette('features/recruit_view', record: :new_episodes) do
      recruiter = create(:recruiter, :with_profile)
      player = create(:player, :with_profile)
      Prospect.create(player_profile_id: player.profile.id, recruiter_profile_id: recruiter.profile.id)
      facility1 = Facility.create(name: "Asbury Elementary", address: "1320 E Asbury Ave, Denver, CO 80210", latitude: 39.680045, longitude: -104.971557)
      facility2 = Facility.create(name: "Calvary Baptist", address: "6500 E Girard Ave, Denver, CO 80224", latitude: 39.653362, longitude: -104.912465)
      facility3 = Facility.create(name: "Holm Elementary", address: "3185 S Willow St, Denver, CO 80231", latitude: 39.657598, longitude: -104.892091)
      game1 = Game.create(facility_id: facility1.id, status: 0, date: DateTime.new(2017, 10, 10))
      game2 = Game.create(facility_id: facility1.id, status: 1, date: DateTime.new(2017, 10, 17))
      game3 = Game.create(facility_id: facility2.id, status: 1, date: DateTime.new(2017, 10, 24))
      game4 = Game.create(facility_id: facility3.id, status: 1, date: DateTime.new(2017, 11, 1))
      team1 = Team.create(name: "Old Gregs")
      team2 = Team.create(name: "Honey Badgers")
      TeamPlayer.create(team_id: team1.id, player_id: player.id)
      GameTeam.create(game_id: game1.id, team_id: team1.id)
      GameTeam.create(game_id: game1.id, team_id: team2.id)
      GameTeam.create(game_id: game2.id, team_id: team1.id)
      GameTeam.create(game_id: game2.id, team_id: team2.id)
      GameTeam.create(game_id: game3.id, team_id: team1.id)
      GameTeam.create(game_id: game3.id, team_id: team2.id)
      GameTeam.create(game_id: game4.id, team_id: team1.id)
      GameTeam.create(game_id: game4.id, team_id: team2.id)
      upcoming = player.upcoming
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)
      visit '/dashboard'
      click_link("Derrick Henry")
      expect(current_path).to eq(player_profile_path(player.profile))
      expect(page).to have_content("Derrick Henry")
      expect(upcoming.count).to eq(3)

      within(first('.game')) do
        expect(page).to have_content(game2.when)
        expect(page).to have_content(game2.vs(player))
      end
    end
  end
end
