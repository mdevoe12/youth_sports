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
    player3 = Player.create(first_name: 'Jerry',
                            last_name: 'Smith',
                            username: 'taddyfan',
                            password_digest: 'hungry4apples!')
    player4 = Player.create(first_name: 'Beth',
                            last_name: 'Sanchez',
                            username: 'horsesurgeon',
                            password_digest: 'realdoctor!')
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
    profile3 = PlayerProfile.create(school: 'High School',
                                    height: '5ft4',
                                    weight: '120',
                                    grade_level: 11,
                                    gpa: 3.0,
                                    guardian_phone: '3205555555',
                                    player_id: player3.id)
    profile4 = PlayerProfile.create(school: 'High School',
                                    height: '5ft4',
                                    weight: '120',
                                    grade_level: 11,
                                    gpa: 3.0, guardian_phone: '3205555555',
                                    player_id: player4.id)
    Prospect.create(player_profile_id: profile1.id,
                    recruiter_profile_id: rec_profile.id)
    Prospect.create(player_profile_id: profile2.id,
                    recruiter_profile_id: rec_profile.id)
    Prospect.create(player_profile_id: profile4.id,
                    recruiter_profile_id: rec_profile.id)
    to_recruit = recruiter.prospects
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)

    visit '/dashboard'

    expect(current_path).to eq('/dashboard')
    expect(page).to_not have_link("Jerry Smith")
    expect(page).to have_link("Morty Smith")
    expect(to_recruit.count).to eq(3)
    expect(page).to have_css(img)
  end
end
