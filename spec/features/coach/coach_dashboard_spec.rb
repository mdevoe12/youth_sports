require 'rails_helper'

describe "#coach_dashboard_index" do

  it "goes to the coach dashboard" do
    coach = create(:coach, :with_profile, type: "Coach")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    visit dashboard_index_path
    expect(page).to have_content("Coach #{coach.last_name}'s Dashboard")
    expect(page).to have_content("Institution: #{coach.profile.institution}")
    expect(page).to have_content("Email: #{coach.profile.email}")
    expect(page).to have_content("Phone: #{coach.profile.phone_number}")
    expect(page).to have_content("Your Teams")
    expect(page).to have_css(".profile-pic")
  end
end
