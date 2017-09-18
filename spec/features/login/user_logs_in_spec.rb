require 'rails_helper'

RSpec.describe "User clicks the Log In button in the navbar" do
  context "as an athlete and" do
    scenario "logs in with Facebook for the first time and is sent to their dashboard after successful creation" do
      facebook = create(:authentication_provider, name: "facebook")
      user = create(:user, email: "katie@keel.com")
      auth = create(:user_authentication, user: user, authentication_provider: facebook, params: stub_facebook)
      # As an athlete
      # When I visit the home page for the first time
      visit '/'
      # And I click "Log In"
      click_on("Log In")
      # And I click "Log In With Facebook"
      click_on("Login with Facebook")
      # And I select my type
      choose("type_Player")
      # And I click Submit
      click_on "Update Account"
      # And I fill in my profile information
      fill_in "player_profile_school", with: "Hufflepuff"
      fill_in "player_profile_height", with: "62"
      fill_in "player_profile_weight", with: "130"
      fill_in "player_profile_grade_level", with: 7
      fill_in "player_profile_gpa", with: 3.1
      fill_in "player_profile_guardian_phone", with: "1234567890"
      # And I click "Create Profile"
      click_on "Create Profile"
      # I should be sent to my dashboard
      expect(current_path).to eq dashboard_index_path
      # And I should see my profile information
      player = Player.last
      expect(page).to have_content player.school
      expect(page).to have_content player.height
      expect(page).to have_content player.weight
      expect(page).to have_content player.grade
      expect(page).to have_content player.gpa
      expect(page).to have_content player.guardian_phone
    end

    scenario "logs in with Facebook after the first time and is sent straight to their dashboard" do
      # As a registered athlete
      facebook = create(:authentication_provider, name: "facebook")
      player = create(:player, :with_profile, email: "katie@keel.com", type: "Player")
      auth = create(:user_authentication, user: player, authentication_provider: facebook, params: stub_facebook)
      # When I visit the home page after my first login
      visit '/'
      # And I click "Log In"
      click_on("Log In")
      # And I click "Log In With Facebook"
      click_on("Login with Facebook")
      # I should be sent to my dashboard
      expect(current_path).to eq dashboard_index_path
    end

    scenario "logs in with Twitter for the first time and is sent to their dashboard after successful creation" do
      # As an athlete
      twitter = create(:authentication_provider, name: "twitter")
      user = create(:user, email: "katie@keel.com")
      auth = create(:user_authentication, user: user, authentication_provider: twitter, params: stub_twitter)
      # When I visit the home page after my first login
      visit "/"
      # And I click "Log In"
      click_on("Log In")
      # And I click "Log In With Twitter"
      click_on("Login with Twitter")
      # And I select my type
      choose("type_Player")
      # And I click submit
      click_on "Update Account"
      # And I enter my profile information
      fill_in "player_profile_school", with: "Hufflepuff"
      fill_in "player_profile_height", with: "62"
      fill_in "player_profile_weight", with: "130"
      fill_in "player_profile_grade_level", with: 7
      fill_in "player_profile_gpa", with: 3.1
      fill_in "player_profile_guardian_phone", with: "1234567890"
      # And I click submit
      click_on "Create Profile"
      # I should be sent to my dashboard
      expect(current_path).to eq dashboard_index_path
      # And I should see my profile information
      player = Player.last
      expect(page).to have_content player.school
      expect(page).to have_content player.height
      expect(page).to have_content player.weight
      expect(page).to have_content player.grade
      expect(page).to have_content player.gpa
      expect(page).to have_content player.guardian_phone
    end

    scenario "logs in with Twitter after the first time and is sent straight to their dashboard" do
      # As a registered athlete
      twitter = create(:authentication_provider, name: "twitter")
      player = create(:player, :with_profile, email: "katie@keel.com", type: "Player")
      auth = create(:user_authentication, user: player, authentication_provider: twitter, params: stub_twitter)
      # When I visit the home page after my first login
      visit '/'
      # And I click "Log In"
      click_on("Log In")
      # And I click "Log In With Twitter"
      click_on("Login with Twitter")
      # I should be sent to my dashboard
      expect(current_path).to eq dashboard_index_path
    end
  end

  context "as a coach and" do
    scenario "logs in with Facebook for the first time and is sent to their dashboard after successful creation" do
      # As a coach
      # When I visit the home page after my first login
      # And I click "Log In"
      # And I click "Log In With Facebook"
      # And I enter my Facebook credentials
      # And I click "Submit"
      # And I select my type
      # And I enter the captcha
      # I should be sent to my dashboard
    end

    scenario "logs in with Facebook after the first time and is sent straight to their dashboard" do
      # As a coach
      # When I visit the home page after my first login
      # And I click "Log In"
      # And I click "Log In With Twitter"
      # And I enter my Twitter credentials
      # And I click "Submit"
      # I should be sent to my dashboard
    end

    scenario "logs in with Twitter for the first time and is sent to their dashboard after successful creation" do
      # As a coach
      # When I visit the home page after my first login
      # And I click "Log In"
      # And I click "Log In With Twitter"
      # And I enter my Twitter credentials
      # And I click "Submit"
      # And I select my type
      # And I enter the captcha
      # I should be sent to my dashboard
    end

    scenario "logs in with Twitter after the first time and is sent straight to their dashboard" do
      # As a coach
      # When I visit the home page after my first login
      # And I click "Log In"
      # And I click "Log In With Facebook"
      # And I enter my Facebook credentials
      # And I click "Submit"
      # I should be sent to my dashboard
    end
  end

  context "as a recruiter and" do
    scenario "logs in with Facebook for the first time and is sent to their dashboard after successful creation" do
      # As a recruiter
      # When I visit the home page after my first login
      # And I click "Log In"
      # And I click "Log In With Facebook"
      # And I enter my Facebook credentials
      # And I click "Submit"
      # And I select my type
      # And I enter the captcha
      # I should be sent to my dashboard
    end

    scenario "logs in with Facebook after the first time and is sent straight to their dashboard" do
     # As a recruiter
     # When I visit the home page after my first login
     # And I click "Log In"
     # And I click "Log In With Facebook"
     # And I enter my Facebook credentials
     # And I click "Submit"
     # I should be sent to my dashboard
    end

    scenario "logs in with Twitter for the first time and is sent to their dashboard after successful creation" do
      # As a recruiter
      # When I visit the home page after my first login
      # And I click "Log In"
      # And I click "Log In With Twitter"
      # And I enter my Twitter credentials
      # And I click "Submit"
      # And I select my type
      # And I enter the captcha
      # I should be sent to my dashboard
    end

    scenario "logs in with Twitter after the first time and is sent straight to their dashboard" do
      # As a recruiter
      # When I visit the home page after my first login
      # And I click "Log In"
      # And I click "Log In With Facebook"
      # And I enter my Facebook credentials
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

  context "after logging in with Facebook and" do
    scenario "can log in with Twitter to the same account" do

    end
  end

  context "after logging in with Twitter and" do
    scenario "can log in with Facebook to the same account" do

    end
  end
end
