require 'rails_helper'

describe "#coach_dashboard_index" do

  it "goes to the coach dashboard" do
    coach = Coach.create(  first_name: "Brandon",
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

    # save_and_open_page

    within ".h2" do
      expect(page).to have_content("Institution: Eagles")
    end
    
    # expect(page).to have_css(".email")
    # expect(page).to have_css(".phone_number")
  end
end
