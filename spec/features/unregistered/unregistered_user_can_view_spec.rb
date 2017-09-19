require 'rails_helper'

RSpec.feature "unregistered user" do
  scenario "click login and see login page" do
    visit root_path
    click_link("Log In")
    click_link("Sign In")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "can see team stats page" do
    coach = create(:user, type: "Coach", first_name: "Bob", last_name: "Bill", password: "password")
    team = create(:team)
    players = create_list(:player, 3, type: "Player")
    facility = Facility.create(name: "test")
    game = Game.create!(facility_id: facility.id, status: 0)
    Player.all.each do |player|
      profile = PlayerProfile.create(player: player)
      PlayerStat.create!(points: 40, fouls: 20, player_profile_id: profile.id, game_id: game.id)
      team.players << player
    end
    TeamCoach.create(team_id: team.id, coach_id: coach.id)

    visit "teams/#{team.id}/stats"

    expect(page).to have_content(team.name)
    expect(page).to have_content(coach.first_name)
    expect(page).to have_content(coach.last_name)
    expect(page).to have_content("Players: 3")
    expect(page).to have_content("Total Points: 120")
    expect(page).to have_content("Total Fouls: 60")
  end
end
