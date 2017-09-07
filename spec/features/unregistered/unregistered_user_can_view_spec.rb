require 'rails_helper'

RSpec.feature "unregistered user" do
  scenario "click login and seed login page" do
    visit root_path

    click_on "Login"

    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
  end
  scenario "can see team stats page" do
    coach = create(:user, type: "Coach", first_name: "Bob", last_name: "Bill", password: "123")
    team = create(:team)
    players = create_list(:user, 3, type: "Player", password: "123")
    Player.all.each do |player|
      PlayerProfile.create(player: player)
      PlayerStat.create(points: 40, fouls: 20, player_profile: PlayerProfile.last)
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
