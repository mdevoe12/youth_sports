require 'rails_helper'

RSpec.feature 'as an unregistered user when I visit a team stats' do
  scenario 'I can see a teams stats' do
    coach = create(:user, type: "Coach")
    team = create(:team)
    TeamCoach.create(team_id: team.id, coach_id: coach.id)

    visit "teams/#{team.id}/stats"

    expect(page).to have_content(team.name)
  end
end
