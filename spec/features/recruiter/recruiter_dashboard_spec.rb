require 'rails_helper'

RSpec.describe 'Registered recruiter logs in' do
  scenario 'and sees their dashboard with their prospects' do
    recruiter = create(:recruiter, :with_profile)
    player_1 = create(:player, :with_profile)
    player_2 = create(:player, :with_profile, first_name: "Mark", last_name: "Ingram")
    Prospect.create(player_profile_id: player_1.profile.id,
                    recruiter_profile_id: recruiter.profile.id)
    facility1 = Facility.create(name: "Asbury Elementary")
    game1 = Game.create(facility_id: facility1.id, status: 1, date: DateTime.new(2017, 10, 10))
    team1 = Team.create(name: "Old Gregs")
    TeamPlayer.create(team_id: team1.id, player_id: player_1.id)
    GameTeam.create(game_id: game1.id, team_id: team1.id)
    to_recruit = recruiter.prospects
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)

    visit '/dashboard'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content(recruiter.name)
    expect(to_recruit.count).to eq(1)
    expect(page).to have_css(".profile-pic")
    expect(page).to have_css(".prospect-table")
    expect(page).to_not have_link("#{player_2.first_name}")
    expect(page).to have_link("#{player_1.profile.first_name}")
    expect(page).to have_content(player_1.school)
    expect(page).to have_content(player_1.teams.first.name)
    expect(page).to have_content(player_1.profile.grade_level)
    expect(page).to have_content(player_1.profile.prospects.first.status)
    expect(page).to have_content(player_1.upcoming.first.when)
  end
end
