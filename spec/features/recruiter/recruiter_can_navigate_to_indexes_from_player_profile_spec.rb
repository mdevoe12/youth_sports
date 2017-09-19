require 'rails_helper'

RSpec.feature "recruiter can use navbar links" do
  scenario "from player profile show" do
    recruiter = create(:recruiter, :with_profile, type: "Recruiter")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)

    player = create(:player, :with_profile, email: "derrickhenry@heismanwinners.com", type: "Player")
    player.teams << create(:team)


    visit("/player_profiles/#{player.profile.id}")
    expect(page).to have_content(player.first_name)

    click_on "Athletes"
    expect(page).to have_content("All Athletes")

    visit("/player_profiles/#{player.profile.id}")

    click_on "Recruiters"
    expect(page).to have_content("All Recruiters")

    visit("/player_profiles/#{player.profile.id}")

    click_on "Coaches"
    expect(page).to have_content("All Coaches")
  end

  scenario "from page they're currently on" do
    recruiter = create(:recruiter, :with_profile, type: "Recruiter")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)
    visit root_path
    click_on "Athletes"

    expect(page).to have_content("All Athletes")

    click_on "Recruiters"
    expect(page).to have_content("All Recruiters")

    click_on "Coaches"

    expect(page).to have_content("All Coaches")
  end

  scenario "recruiter can log out" do
    recruiter = create(:recruiter, :with_profile, type: "Recruiter")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)
    visit root_path
    expect(page).to have_content("Logout")

    click_on "Logout"

    expect(page).to have_content("Logged out!")
  end
end
