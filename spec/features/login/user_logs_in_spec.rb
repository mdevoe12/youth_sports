require 'rails_helper'

# write this for coach and Recruiter
# and all 3 for the twitter login
# and all 3 for the bcrypt login

RSpec.describe "User clicks the Log In button in the navbar" do
  context "as an athlete and" do
    scenario "logs in with Facebook for the first time" do
      # As an athlete
      # When I visit the home page for the first time
      visit '/'

      # And I click "Log In"
      click_on("Log In")

      # And I click "Log In With Facebook"
      click_button("Log In With Facebook")

      # And I enter my Facebook credentials
      # And I click "Submit"
      # And I select my type
      # And I enter the captcha
      # And I click Submit
      # I should be sent to my dashboard
    end

    scenario "logs in with Facebook after the first time" do
      # As a registered athlete
      # When I visit the home page after my first login
      # And I click "Log In"
      # And I click "Log In With Facebook"
      # And I enter my Facebook credentials
      # And I click "Submit"
      # I should be sent to my dashboard
    end

    scenario "logs in with Twitter for the first time" do
      # As an athlete
      # When I visit the home page after my first login
      # And I click "Log In"
      # And I click "Log In With Twitter"
      # And I enter my Twitter credentials
      # And I click "Submit"
      # And I select my type
      # And I enter the captcha
      # I should be sent to my dashboard
    end

    scenario "logs in with Twitter after the first time" do
      # As a registered athlete
      # When I visit the home page after my first login
      # And I click "Log In"
      # And I click "Log In With Twitter"
      # And I enter my Twitter credentials
      # And I click "Submit"
      # I should be sent to my dashboard
    end
  end

  scenario "logs in with bcrypt" do
    # As a registered user
    # When I visit the home page
    # And I click "Log In"
    # And I click "Log In/Sign Up"
    # And I enter my username and password
    # And I click "Submit"
    # I should be sent to my dashboard
  end
end
