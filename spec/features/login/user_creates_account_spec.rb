require 'rails_helper'

RSpec.describe "User creates standard account" do
  context "as an athlete and" do
    scenario "is sent to their dashboard upon creation" do
      # As an athlete
      # When I visit the home page
      visit "/"
      # And I click "Log In"
      click_on "Log In"
      # And I click "Create Account"
      click_on "Create Account"
      # And I enter an email
      fill_in "user_email", with: "user@user.com"
      # And I enter a password
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      # And I click submit
      click_on "Sign up"
      # I should be sent to the login page
      expect(current_path).to eq "/login"
      # And I should see a message that I created my account
      expect(page).to have_content "Welcome! You have signed up successfully."
      # And when I log in to my new account
      user = User.last
      fill_in "session_email", with: user.email
      fill_in "session_password", with: "password"
      click_on "Log in"
      # I should be prompted to select my user type
      expect(current_path).to eq new_type_selection_path
      # And when I select my type
      choose("type_Player")
      # And I click Submit
      click_on "Update Account"
      # And I enter my profile information
      fill_in "player_profile_first_name", with: "Cedric"
      fill_in "player_profile_last_name", with: "Diggory"
      fill_in "player_profile_school", with: "Hufflepuff"
      fill_in "player_profile_height", with: "62"
      fill_in "player_profile_weight", with: "130"
      fill_in "player_profile_grade_level", with: 7
      fill_in "player_profile_gpa", with: 3.1
      fill_in "player_profile_guardian_phone", with: "1234567890"
      # And I click submit
      click_on "Create Profile"
      # I should be taken to my dashboard
      expect(current_path).to eq dashboard_index_path
      # And I should see my information
      player = Player.last
      expect(page).to have_content player.school
      expect(page).to have_content player.height
      expect(page).to have_content player.weight
      expect(page).to have_content player.grade
      expect(page).to have_content player.gpa
      expect(page).to have_content player.guardian_phone
    end
  end

  context "as a coach and" do
    scenario "is sent to their dashboard upon creation" do
      # As a coach
      # When I visit the home page
      visit "/"
      # And I click "Log In"
      click_on "Log In"
      # And I click "Create Account"
      click_on "Create Account"
      # And I enter an email
      fill_in "user_email", with: "user@user.com"
      # And I enter a password
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      # And I click submit
      click_on "Sign up"
      # I should be sent to the login page
      expect(current_path).to eq "/login"
      # And I should see a message that I created my account
      expect(page).to have_content "Welcome! You have signed up successfully."
      # And when I log in to my new account
      user = User.last
      fill_in "session_email", with: user.email
      fill_in "session_password", with: "password"
      click_on "Log in"
      # I should be prompted to select my user type
      expect(current_path).to eq new_type_selection_path
      # And when I select my type
      choose("type_Coach")
      # And I click submit
      click_on "Update Account"
      fill_in "coach_profile_first_name", with: "Bob"
      fill_in "coach_profile_last_name", with: "Smith"
      fill_in "coach_profile_institution", with: "Harvard"
      fill_in "coach_profile_email", with: "coach@harvard.com"
      fill_in "coach_profile_phone_number", with: "1234567890"
      # And I click submit
      click_on "Create Profile"
      # I should be sent to my dashboard
      expect(current_path).to eq dashboard_index_path
    end
  end

  context "as a recruiter and" do
    scenario "is sent to their dashboard upon creation" do
      # As a recruiter
      # When I visit the home page
      visit "/"
      # And I click "Log In"
      click_on "Log In"
      # And I click "Create Account"
      click_on "Create Account"
      # And I enter an email
      fill_in "user_email", with: "user@user.com"
      # And I enter a password
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      # And I click submit
      click_on "Sign up"
      # I should be sent to the login page
      expect(current_path).to eq "/login"
      # And I should see a message that I created my account
      expect(page).to have_content "Welcome! You have signed up successfully."
      # And when I log in to my new account
      user = User.last
      fill_in "session_email", with: user.email
      fill_in "session_password", with: "password"
      click_on "Log in"
      # I should be prompted to select my user type
      expect(current_path).to eq new_type_selection_path
      # And when I select my type
      choose("type_Recruiter")
      # And I click submit
      click_on "Update Account"
      # And I enter my profile information
      fill_in "recruiter_profile_first_name", with: "Bob"
      fill_in "recruiter_profile_last_name", with: "Smith"
      fill_in "recruiter_profile_institution", with: "Harvard"
      fill_in "recruiter_profile_email", with: "recruiter@harvard.com"
      fill_in "recruiter_profile_phone_number", with: "1234567890"
      # And I click submit
      click_on "Create Profile"
      # I should be taken to my dashboard
      expect(current_path).to eq dashboard_index_path
    end
  end
end
