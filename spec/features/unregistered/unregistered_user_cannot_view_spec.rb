require 'rails_helper'

RSpec.feature "unregistered user cannot" do
  scenario "view /dashboard without logging in" do
    visit '/dashboard'

    expect(current_path).to eq login_path
  end

  scenario "cannot view player profiles" do
    player = create(:player, :with_profile)

    visit player_profile_path(player.profile.id)

    expect(current_path).to eq login_path
  end

  scenario "cannot view coach profile" do
    coach = create(:coach, :with_profile)

    visit coach_profile_path(coach.profile.id)

    expect(current_path).to eq login_path
  end

  scenario "cannot view recruiter profile" do
    recruiter = create(:recruiter, :with_profile)

    visit recruiter_profile_path(recruiter.profile.id)

    expect(current_path).to eq login_path
  end
end
