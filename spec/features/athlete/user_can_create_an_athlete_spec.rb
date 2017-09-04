require 'rails_helper'

RSpec.feature "home page visitation"  do
  describe "when visiting the home page" do
    scenario "a visitor can enter info and create an athlete account" do
      visit root_path
      click_on "Sign up as an Athlete"
      fill_in "user[name]", with: "Brandon"
      fill_in "user[username]", with: "B1"
      fill_in "user[password]", with: "password"
      fill_in "user[confirmation_password]", with: "password"
      click_on "Create Account"

      expect(current_path).to eq(new_athlete_path)
      expect(page).to have_content("Sign up with Twitter")
      expect(page).to have_content("Sign up with Google")

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("Brandon")
      expect(page).to have_content("B1")

    end
  end
end
