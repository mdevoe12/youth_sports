require 'rails_helper'

RSpec.feature "unregistered user" do
  scenario "cannot view /dashboard" do
    visit '/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  scenario "cannot view player profiles" do
    player = Player.create(first_name: "steve", last_name: "madden", password: "123")
    profile = PlayerProfile.create(school: "BG", player_id: player.id)

    visit player_profile_path(profile.id)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  scenario "cannot view coach profile" do
    coach = Coach.create(first_name: "harry", last_name: "henderson", password: "123")
    profile = CoachProfile.create(coach_id: coach.id)

    visit coach_profile_path(profile.id)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
