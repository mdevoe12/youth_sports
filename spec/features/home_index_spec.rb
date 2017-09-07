require 'rails_helper'

describe "#home index" do
  it "goes to the home page" do
    visit "/"
    # expect(current_path).to eq(home)
    expect(page).to have_content("Login with Twitter")
  end

  it "has a nav bar" do
    visit root_path
    expect(page).to have_link("Sign Up as an Athlete")
    expect(page).to have_link("Sign Up as a Recruiter")
    expect(page).to have_link("Login")
  end

  xit "can see buttons to log in with Oauth" do
    visit "/"
    expect(page).to have_link("Sign up with Facebook")
    expect(page).to have_content("Sign up with Google")
  end
end
