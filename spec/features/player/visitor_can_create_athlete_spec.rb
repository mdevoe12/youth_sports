require 'rails_helper'

RSpec.feature "home page visitation"  do
  describe "when visiting the home page" do
    scenario "a visitor can enter info and create an athlete account" do
      aj = Player.create(first_name: 'AJ',
                              last_name: 'Randall',
                              username: 'aj',
                              password_digest: 'aj')
      # profile = PlayerProfile()
      visit root_path

      click_on "Sign Up as an Athlete"

      expect(current_path).to eq(new_player_path)
      expect(page).to have_content("Sign up with Twitter")
      expect(page).to have_content("Sign up with Google")

      fill_in "player[first_name]", with: "AJ"
      fill_in "player[last_name]", with: "Randall"
      fill_in "player[username]", with: "aj"
      fill_in "player[password]", with: "aj"
      fill_in "player[confirmation_password]", with: "aj"
      click_on "Create Account"

      expect(current_path).to eq(player_path(aj.id))
      expect(page).to have_content("AJ")
      expect(page).to have_content("Randall")

    end
  end
end
