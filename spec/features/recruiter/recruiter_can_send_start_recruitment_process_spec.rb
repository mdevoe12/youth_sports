require 'rails_helper'

RSpec.feature "recruiter starts recruitment process" do
  before(:each) do
    recruiter = create(:recruiter, :with_profile)
    player = create(:player, :with_profile)
    facility = create(:facility)
    game = create(:game, facility: facility)
    PlayerStat.create(points: 40, fouls: 20, player_profile: player.profile, game: game)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@recruiter)
  end

  scenario "recruiter starts recruitment" do
    visit("/player_profiles/#{@player.profile.id}")

    expect(page).to have_button("Start Recruitment")

    VCR.use_cassette("/features/recruiter/recruiter_can_send_start_recruitment_process_spec.rb") do
      click_on "Start Recruitment"

      expect(current_path).to eq("/player_profiles/#{@profile.id}")
      expect(player.profile.prospects.last.status).to eq("in-progress")
      expect(page).to have_content("You've sent a request to the player's guardian.")
    end
  end

  scenario "guardian responds with token" do
    Prospect.create(recruiter_profile_id: @recr_profile.id,
                       player_profile_id: @player.profile.id,
                                   token: "y1234")

    rack_test_session_wrapper = Capybara.current_session.driver
    rack_test_session_wrapper.post(receive_text_path,
    params = {
      Body: "y1234 yes",
      From: "+#{@profile.guardian_phone}"})

    expect(Player.last.profile.prospects.last.status).to eq("prospect")
  end

  scenario "guardian responds no" do
    Prospect.create(recruiter_profile_id: @recr_profile.id,
                       player_profile_id: @profile.id,
                                   token: "y1234")

    rack_test_session_wrapper = Capybara.current_session.driver
    rack_test_session_wrapper.post(receive_text_path,
    params = {
      Body: "y1234 no",
      From: "+#{@profile.guardian_phone}"})

    expect(Player.last.profile.prospects.last.status).to eq("denied")
  end
end
