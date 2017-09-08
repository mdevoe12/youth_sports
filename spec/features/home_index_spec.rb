require 'rails_helper'

describe "#home index" do
  it "has a nav bar" do
    visit root_path
    expect(page).to have_link("Sign Up as an Athlete")
    expect(page).to have_link("Sign Up as a Recruiter")
    expect(page).to have_link("Login")
  end
end
