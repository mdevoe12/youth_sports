require 'rails_helper'

RSpec.feature 'as an unregistered user when I visit a team stats' do
  scenario 'I can see a teams stats' do
    coach = create(:user, type: "Coach", first_name: "Bob", last_name: "Bill")
    team = create(:team)
    players = create_list(:user, 3, type: "Player")
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
