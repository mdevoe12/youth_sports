require 'rails_helper'

RSpec.feature "recruiter can request to start recruitment process" do
  scenario "recruiter clicks start recruitment button" do
    recruiter = User.create(type: "Recruiter",
                        first_name: "test",
                        last_name: "test",
                        password: "123")
    recr_profile = RecruiterProfile.create(recruiter_id: recruiter.id)
    player = User.create(type: "Player", password: "123")
    profile = PlayerProfile.create(player_id: player.id, guardian_phone: "6073426730")
    PlayerStat.create(points: 40, fouls: 20, player_profile: profile)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)

    visit profiles_path(player)

    expect(page).to have_button("Start Recruitment")

    VCR.use_cassette("/features/recruiter/recruiter_can_send_start_recruitment_process_spec.rb") do
      click_on "Start Recruitment"

      expect(current_path).to eq("/profiles/player_profile/#{player.id}")
      expect(player.profile.prospects.last.status).to eq("in-progress")
      expect(page).to have_content("You've sent a request to the player's guardian.")
    end
  end

  scenario "system will receive message back" do
    "I'm a little tea pot short and stout"
  end

end
