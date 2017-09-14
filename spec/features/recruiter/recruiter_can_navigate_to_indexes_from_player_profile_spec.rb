require 'rails_helper'

RSpec.feature "recruiter can use navbar links" do
    before(:each) do
      @recruiter = User.create(type: "Recruiter",
                          first_name: "test",
                          last_name: "test",
                          password: "123")
      @recr_profile = RecruiterProfile.create(recruiter_id: @recruiter.id)
      @player = User.create(type: "Player", first_name: "Henry", last_name: "Ford", password: "123")
      @profile = PlayerProfile.create(player_id: @player.id, guardian_phone: "16073426730")
      @facility = Facility.create(name: "test")
      @game = Game.create!(facility_id: @facility.id, status: 0)
      @team = Team.create(name: "Broncos")
      @team.players << @player
      PlayerStat.create(points: 40, fouls: 20, player_profile: @profile, game_id: @game.id)
      Prospect.create(recruiter_profile_id: @recr_profile.id, player_profile_id: @profile.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@recruiter)
    end

  scenario "from player profile show" do
    visit player_profile_path(@profile)

    expect(page).to have_content(@player.first_name)
    click_on "Athletes"

    expect(page).to have_content("All Athletes")
    visit player_profile_path(@profile)

    click_on "Recruiters"
    expect(page).to have_content("All Recruiters")

    visit player_profile_path(@profile)
    click_on "Coaches"

    expect(page).to have_content("All Coaches")
  end

  scenario "from page they're currently on" do
    visit root_path
    click_on "Athletes"

    expect(page).to have_content("All Athletes")

    click_on "Recruiters"
    expect(page).to have_content("All Recruiters")

    click_on "Coaches"

    expect(page).to have_content("All Coaches")
  end

  scenario "recruiter can log out" do
    visit root_path

    expect(page).to have_content("Logout")

    click_on "Logout"

    expect(page).to have_content("Logged out!")
  end
end
