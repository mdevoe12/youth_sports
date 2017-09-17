require 'rails_helper'

RSpec.describe 'Registered recruiter logs in' do
  scenario 'and sees their dashboard with their prospects' do
    recruiter = Recruiter.create( first_name: 'Mister',
                                  last_name: 'Meseeks',
                                  username: 'existenceispain',
                                  password_digest: 'lookatme!')
    rec_profile = RecruiterProfile.create(institution: 'Smith Garage',
                                  email: 'meseeks@box.com',
                                  recruiter_id: recruiter.id)
    player1 = Player.create(first_name: 'Morty',
                            last_name: 'Smith',
                            username: 'onetruemorty',
                            password_digest: 'ohgeez!')
    player2 = Player.create(first_name: 'Summer',
                            last_name: 'Smith',
                            username: 'summerallyear',
                            password_digest: 'totally!')
    profile1 = PlayerProfile.create(school: 'High School',
                                    height: '5ft4',
                                    weight: '120',
                                    grade_level: 11,
                                    gpa: 3.0,
                                    guardian_phone: '3205555555',
                                    player_id: player1.id)
    profile2 = PlayerProfile.create(school: 'High School',
                                    height: '5ft4',
                                    weight: '120',
                                    grade_level: 11,
                                    gpa: 3.0,
                                    guardian_phone: '3205555555',
                                    player_id: player2.id)
    Prospect.create(player_profile_id: profile1.id,
                    recruiter_profile_id: rec_profile.id)
    facility1 = Facility.create(name: "Asbury Elementary")
    game1 = Game.create(facility_id: facility1.id, status: 1, date: DateTime.new(2017, 10, 10))
    team1 = Team.create(name: "Old Gregs")
    TeamPlayer.create(team_id: team1.id, player_id: player1.id)
    GameTeam.create(game_id: game1.id, team_id: team1.id)
    to_recruit = recruiter.prospects
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)

    visit '/dashboard'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content(recruiter.name)
    expect(to_recruit.count).to eq(1)
    expect(page).to have_css(".profile-pic")
    expect(page).to have_css(".prospect-table")
    expect(page).to_not have_link("Jerry Smith")
    expect(page).to have_link("Morty Smith")
    expect(page).to have_content(player1.school)
    expect(page).to have_content(player1.teams.first.name)
    expect(page).to have_content(profile1.grade_level)
    expect(page).to have_content(profile1.prospects.first.status)
    expect(page).to have_content(player1.upcoming.first.when)
  end
end
