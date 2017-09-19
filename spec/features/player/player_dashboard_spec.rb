require 'rails_helper'

RSpec.describe 'A logged in player' do
  scenario 'sees their dashboard' do
    player = create(:player, :with_profile, type: "Player")
    profile = player.profile

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(player)

    visit '/dashboard'

    expect(page).to have_content("#{player.name}'s Dashboard")
    expect(page).to have_content(profile.school)
    expect(page).to have_content(profile.height)
    expect(page).to have_content(profile.weight)
    expect(page).to have_content(profile.grade_level)
    expect(page).to have_content(profile.gpa)
    expect(page).to have_content(profile.guardian_phone)
    expect(page).to have_css(".profile-pic")
    expect(page).to have_link("Add your favorite player's screename to see recent tweets")
  end
end
