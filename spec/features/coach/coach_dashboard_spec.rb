require 'rails_helper'

describe "#coach_dashboard_index" do

  it "goes to the coach dashboard" do
    coach = create(:coach, :with_profile)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    visit "/dashboard"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Coach #{coach.last_name}")
    expect(page).to have_content("Institution: Eagles")
    expect(page).to have_content("Email: #{profile.email}")
    expect(page).to have_content("Phone: #{profile.phone_number}")
    expect(page).to have_content("Your Teams")
    expect(page).to have_css(".profile-pic")
  end
end
