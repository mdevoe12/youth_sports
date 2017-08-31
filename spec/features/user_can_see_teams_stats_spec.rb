require 'rails_helper'

RSpec.feature 'as an unregistered user when I visit a team stats' do
  scenario 'I can see a teams stats' do
    team = create(:team)

    visit team_stat_path(team)

    expect(page).to have_content(team.name)
  end
end
