require 'rails_helper'

RSpec.describe 'A logged in recruiter clicks on a player name' do
  scenario 'and sees that players profile page with map of upcoming games' do
    recruiter = Recruiter.create(first_name: 'Mister', last_name: 'Meseeks', username: 'existenceispain', password_digest: 'lookatme!')
    rec_profile = RecruiterProfile.create(institution: 'Smith Garage', email: 'meseeks@box.com', recruiter_id: recruiter.id)
    player1 = Player.create(first_name: 'Morty', last_name: 'Smith', username: 'onetruemorty', password_digest: 'ohgeez!')
    profile1 = PlayerProfile.create(school: 'High School', height: '5ft4', weight: '120', grade_level: 11, gpa: 3.0, guardian_phone: '3205555555', player_id: player1.id)
    Prospect.create(player_profile_id: profile1.id, recruiter_profile_id: rec_profile.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)

    visit '/dashboard'
    click_on 'Morty Smith'

    expect(current_path).to eq(player_profile_path(profile1))
  end
end
