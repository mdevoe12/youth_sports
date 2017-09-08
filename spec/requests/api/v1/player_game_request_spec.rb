require 'rails_helper'

describe 'Player API Games endpoint' do
  before(:each) do
    recruiter = Recruiter.create(first_name: 'Mister', last_name: 'Meseeks', username: 'existenceispain', password_digest: 'lookatme!')
    rec_profile = RecruiterProfile.create(institution: 'Smith Garage', email: 'meseeks@box.com', recruiter_id: recruiter.id)
    @player = Player.create(first_name: 'Morty', last_name: 'Smith', username: 'onetruemorty', password_digest: 'ohgeez!')
    profile = PlayerProfile.create(school: 'High School', height: '5ft4', weight: '120', grade_level: 11, gpa: 3.0, guardian_phone: '3205555555', player_id: @player.id)
    Prospect.create(player_profile_id: profile.id, recruiter_profile_id: rec_profile.id)
    facility1 = Facility.create(name: "Asbury Elementary", address: "1320 E Asbury Ave, Denver, CO 80210", latitude: 39.680045, longitude: -104.971557)
    facility2 = Facility.create(name: "Calvary Baptist", address: "6500 E Girard Ave, Denver, CO 80224", latitude: 39.653362, longitude: -104.912465)
    facility3 = Facility.create(name: "Holm Elementary", address: "3185 S Willow St, Denver, CO 80231", latitude: 39.657598, longitude: -104.892091)
    game1 = Game.create(facility_id: facility1.id, status: 0, date: DateTime.new(2017, 10, 10))
    game2 = Game.create(facility_id: facility1.id, status: 1, date: DateTime.new(2017, 10, 17))
    game3 = Game.create(facility_id: facility2.id, status: 1, date: DateTime.new(2017, 10, 24))
    game4 = Game.create(facility_id: facility3.id, status: 1, date: DateTime.new(2017, 11, 1))
    team1 = Team.create(name: "Old Gregs")
    team2 = Team.create(name: "Honey Badgers")
    TeamPlayer.create(team_id: team1.id, player_id: @player.id)
    GameTeam.create(game_id: game1.id, team_id: team1.id)
    GameTeam.create(game_id: game1.id, team_id: team2.id)
    GameTeam.create(game_id: game2.id, team_id: team1.id)
    GameTeam.create(game_id: game2.id, team_id: team2.id)
    GameTeam.create(game_id: game3.id, team_id: team1.id)
    GameTeam.create(game_id: game3.id, team_id: team2.id)
    GameTeam.create(game_id: game4.id, team_id: team1.id)
    GameTeam.create(game_id: game4.id, team_id: team2.id)
  end
  it 'returns list of games with associated player id' do
    get "/api/v1/players/games?id=#{@player.id}"

    expect(response).to be_success
    bod = response.body
    require "pry"; binding.pry
  end
end
