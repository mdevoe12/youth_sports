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

  context "as a recruiter and" do
    scenario "logs in with Facebook for the first time and is sent to their dashboard after successful creation" do
      facebook = create(:authentication_provider, name: "facebook")
      user = create(:user, email: "katie@keel.com")
      auth = create(:user_authentication, user: user, authentication_provider: facebook, params: stub_facebook)
      # As a recruiter
      # When I visit the home page for the first time
      visit '/'
      # And I click "Log In"
      click_on("Log In")
      # And I click "Log In With Facebook"
      click_on("Login with Facebook")
      # And I select my type
      choose("type_Recruiter")
      # And I click Submit
      click_on "Update Account"
      # And I fill in my profile information
      fill_in "recruiter_profile_institution", with: "Harvard"
      fill_in "recruiter_profile_email", with: "recruiter@harvard.com"
      fill_in "recruiter_profile_phone_number", with: "1234567890"
      # And I click submit
      click_on "Create Profile"
      # I should be taken to my dashboard
      expect(current_path).to eq dashboard_index_path
    end

    scenario "logs in with Facebook after the first time and is sent straight to their dashboard" do
      facebook = create(:authentication_provider, name: "facebook")
      recruiter = create(:recruiter, :with_profile, email: "katie@keel.com", type: "Recruiter")
      auth = create(:user_authentication, user: recruiter, authentication_provider: facebook, params: stub_facebook)
      # As a recruiter
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
      twitter = create(:authentication_provider, name: "twitter")
      user = create(:user, email: "katie@keel.com")
      auth = create(:user_authentication, user: user, authentication_provider: twitter, params: stub_twitter)
      # As a recruiter
      # When I visit the home page for the first time
      visit '/'
      # And I click "Log In"
      click_on("Log In")
      # And I click "Log In With Twitter"
      click_on("Login with Twitter")
      # And I select my type
      choose("type_Recruiter")
      # And I click Submit
      click_on "Update Account"
      # And I fill in my profile information
      fill_in "recruiter_profile_institution", with: "Harvard"
      fill_in "recruiter_profile_email", with: "recruiter@harvard.com"
      fill_in "recruiter_profile_phone_number", with: "1234567890"
      # And I click submit
      click_on "Create Profile"
      # I should be taken to my dashboard
      expect(current_path).to eq dashboard_index_path
    end

    scenario "logs in with Twitter after the first time and is sent straight to their dashboard" do
      twitter = create(:authentication_provider, name: "twitter")
      recruiter = create(:recruiter, :with_profile, email: "katie@keel.com", type: "Recruiter")
      auth = create(:user_authentication, user: recruiter, authentication_provider: twitter, params: stub_twitter)
      # As a recruiter
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
      facebook = create(:authentication_provider, name: "facebook")
      user = create(:user, email: "katie@keel.com")
      auth = create(:user_authentication, user: user, authentication_provider: facebook, params: stub_facebook)
      # As a coach
      # When I visit the home page for the first time
      visit '/'
      # And I click "Log In"
      click_on("Log In")
      # And I click "Log In With Facebook"
      click_on("Login with Facebook")
      # And I select my type
      choose("type_Coach")
      # And I click Submit
      click_on "Update Account"
      expect(current_path).to eq new_coach_profile_path
      # And I fill in my profile information
      fill_in "coach_profile_institution", with: "Harvard"
      fill_in "coach_profile_email", with: "coach@harvard.com"
      fill_in "coach_profile_phone_number", with: "1234567890"
      # And I click submit
      click_on "Create Profile"
      # I should be sent to my dashboard
      expect(current_path).to eq dashboard_index_path
    end

    scenario "logs in with Facebook after the first time and is sent straight to their dashboard" do
      facebook = create(:authentication_provider, name: "facebook")
      coach = create(:coach, :with_profile, email: "katie@keel.com", type: "Coach")
      auth = create(:user_authentication, user: coach, authentication_provider: facebook, params: stub_facebook)
      # As a coach
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
      twitter = create(:authentication_provider, name: "twitter")
      user = create(:user, email: "katie@keel.com")
      auth = create(:user_authentication, user: user, authentication_provider: twitter, params: stub_twitter)
      # As a coach
      # When I visit the home page for the first time
      visit '/'
      # And I click "Log In"
      click_on("Log In")
      # And I click "Log In With Twitter"
      click_on("Login with Twitter")
      # And I select my type
      choose("type_Coach")
      # And I click Submit
      click_on "Update Account"
      expect(current_path).to eq new_coach_profile_path
      # And I fill in my profile information
      fill_in "coach_profile_institution", with: "Harvard"
      fill_in "coach_profile_email", with: "coach@harvard.com"
      fill_in "coach_profile_phone_number", with: "1234567890"
      # And I click submit
      click_on "Create Profile"
      # I should be sent to my dashboard
      expect(current_path).to eq dashboard_index_path
    end

    scenario "logs in with Twitter after the first time and is sent straight to their dashboard" do
      twitter = create(:authentication_provider, name: "twitter")
      coach = create(:coach, :with_profile, email: "katie@keel.com", type: "Coach")
      auth = create(:user_authentication, user: coach, authentication_provider: twitter, params: stub_twitter)
      # As a coach
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

  scenario "logs in with bcrypt" do
    # As a registered user
    user = create(:user, :with_profile, type: "Player")
    # When I visit the home page
    visit '/'
    # And I click "Log In"
    click_on "Log In"
    # And I click "Sign In"
    click_on "Sign In"
    # And I enter my username and password
    fill_in "session_email", with: user.email
    fill_in "session_password", with: "password"
    # And I click "Submit"
    click_on "Log in"
    # I should be sent to my dashboard
    expect(current_path).to eq dashboard_index_path
  end

  context "after logging in with Facebook and" do
    scenario "can log in with Twitter to the same account" do
      # As a user
      # After I've created my account by logging in with Facebook
      facebook = create(:authentication_provider, name: "facebook")
      user = create(:user, :with_profile, email: "katie@keel.com", type: "Player")
      auth = create(:user_authentication, user: user, authentication_provider: facebook, params: stub_facebook)

      visit "/"

      click_on "Log In"
      click_on "Login with Facebook"

      # And I log out
      click_link "#{user.username}"
      click_on "Logout"
      expect(current_path).to eq root_path

      twitter = create(:authentication_provider, name: "twitter")
      auth = create(:user_authentication, user: user, authentication_provider: twitter, params: stub_twitter)
      # And I click "Log In"
      click_on "Log In"
      # And I click "Log in with Twitter"
      click_on "Login with Twitter"
      # I should be directed to the same account
      expect(current_path).to eq dashboard_index_path
      expect(page).to have_link "#{user.username}"
    end
  end

  context "after logging in with Twitter and" do
    scenario "can log in with Facebook to the same account" do
      # As a user
      # After I've created my account by logging in with Twitter
      twitter = create(:authentication_provider, name: "twitter")
      user = create(:user, :with_profile, email: "katie@keel.com", type: "Player")
      auth = create(:user_authentication, user: user, authentication_provider: twitter, params: stub_twitter)

      visit "/"

      click_on "Log In"
      click_on "Login with Twitter"

      # And I log out
      click_link "#{user.username}"
      click_on "Logout"
      expect(current_path).to eq root_path

      facebook = create(:authentication_provider, name: "facebook")
      auth = create(:user_authentication, user: user, authentication_provider: facebook, params: stub_facebook)
      # And I click "Log In"
      click_on "Log In"
      # And I click "Log in with Facebook"
      click_on "Login with Facebook"
      # I should be directed to the same account
      expect(current_path).to eq dashboard_index_path
      expect(page).to have_link "#{user.username}"
    end
  end
end
