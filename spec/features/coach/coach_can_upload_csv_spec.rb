require 'rails_helper'

RSpec.feature "A coach" do
  scenario "can see upload csv" do
    coach = Coach.create(  first_name: "Brandon",
                          last_name: "Randall",
                          password: "123")
    profile = CoachProfile.create(institution: "Eagles",
                                  email: "1@gmail.com",
                                  phone_number: "123",
                                  coach_id: coach.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(coach)

    visit "/dashboard"

    expect(page).to have_button("Upload CSV")

    attach_file(:file, 'spec/features/upload_files/test_csv.csv')
    click_button "Upload CSV"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Items imported")
  end
end
