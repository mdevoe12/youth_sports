require 'rails_helper'

RSpec.feature "recruiter can request to start recruitment process" do
  scenario "recruiter clicks start recruitment button" do
    recruiter = create(:user,
                        type: "Recruiter",
                        first_name: "test",
                        last_name: "test",
                        password: "123")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)

    visit player_profile_path

    expect(page).to have_content("Start Recruitment")
  end

end
