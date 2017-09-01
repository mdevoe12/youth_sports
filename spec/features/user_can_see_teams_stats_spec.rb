require 'rails_helper'

RSpec.feature 'as an unregistered user when I visit a team stats' do
  scenario 'I can see a teams stats' do
    coach = create(:user, type: "Coach", first_name: "Bob", last_name: "Bill")
    players = create_list(:user, 3, type: "Player")
    team = create(:team)
    Player.all.each { |player| team.players << player }
    TeamCoach.create(team_id: team.id, coach_id: coach.id)


    visit "teams/#{team.id}/stats"

    expect(page).to have_content(team.name)
    expect(page).to have_content(coach.first_name)
    expect(page).to have_content(coach.last_name)
    expect(page).to have_content("Players: 3")

  end
end
