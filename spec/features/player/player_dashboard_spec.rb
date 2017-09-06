require 'rails_helper'

RSpec.describe 'A logged in player' do
  scenario 'sees their dashboard' do
    recruiter = Recruiter.create( first_name: 'Mister',
                                  last_name: 'Meseeks',
                                  username: 'existenceispain',
                                  password_digest: 'lookatme!')
    rec_profile = RecruiterProfile.create(institution: 'Smith Garage',
                                  email: 'meseeks@box.com',
                                  recruiter_id: recruiter.id)
    coach = Coach.create(  first_name: "Bobby",
                           last_name: "Knight",
                           uid: "bk",
                           password_digest: "bk")
    player = Player.create(first_name: 'Morty',
                            last_name: 'Smith',
                            username: 'onetruemorty',
                            password_digest: 'ohgeez!')

    profile = PlayerProfile.create(school: 'High School',
                                    height: '5ft4',
                                    weight: '120',
                                    grade_level: 11,
                                    gpa: 3.0,
                                    guardian_phone: '3205555555',
                                    player_id: player.id)

    Prospect.create(player_profile_id: profile.id,
                    recruiter_profile_id: rec_profile.id,
                                  status: "prospect")
    team = Team.create(name: "Gherkins")
    team.players << player
    team.coaches << coach

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(player)

    visit '/dashboard'

    expect(page).to have_content("Hello #{player.first_name}")
    expect(page).to have_content(team.name)
    expect(page).to have_content(coach.name)
    expect(page).to have_content(profile.school)
    expect(page).to have_content(profile.height)
    expect(page).to have_content(profile.weight)
    expect(page).to have_content(profile.grade_level)
    expect(page).to have_content(profile.gpa)
    expect(page).to have_content(profile.guardian_phone)
  end
end
