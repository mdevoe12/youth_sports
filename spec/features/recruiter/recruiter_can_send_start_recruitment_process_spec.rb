require 'rails_helper'

RSpec.feature "recruiter can request to start recruitment process" do
  scenario "recruiter clicks start recruitment button" do
    recruiter = create(:user,
                        type: "Recruiter",
                        first_name: "test",
                        last_name: "test",
                        password: "123")
    player = create(:user, type: "Player", password: "123")
    profile = PlayerProfile.create(player_id: player.id)
    PlayerStat.create(points: 40, fouls: 20, player_profile: profile)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)

    visit profiles_path(player)

    expect(page).to have_content("Start Recruitment")
  end

end
