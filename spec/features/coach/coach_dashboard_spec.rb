require 'rails_helper'

describe "#coach_dashboard_index" do

  it "goes to the coach dashboard" do
    coach = User.create( first_name: "Brandon",
                          type: "Coach",
                          last_name: "Randall",
                          password: "123")
    profile = CoachProfile.create(institution: "Eagles",
                                  email: "1@gmail.com",
                                  phone_number: "123",
                                  coach_id: coach.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)
    visit "/coach"
    expect(current_path).to eq("/coach")
    expect(page).to have_content("Hello #{coach.type} #{coach.first_name}")
    expect(page).to have_css(".institution")
    expect(page).to have_css(".email")
    expect(page).to have_css(".phone_number")
    save_and_open_page
  end
end
