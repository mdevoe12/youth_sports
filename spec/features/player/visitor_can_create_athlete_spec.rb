# require 'rails_helper'
#
# RSpec.feature "home page visitation"  do
#   describe "when visiting the home page" do
#     scenario "a visitor can enter info and create an athlete account" do
#
#       visit root_path
#
#       expect(page).to have_link("Sign Up as an Athlete")
#       # login_with_oauth
#       within('.dropdown-menu') do
#         click_link("Sign Up as an Athlete")
#       end
#
#       fill_in "player[first_name]", with: "AJ"
#       fill_in "player[last_name]", with: "Randall"
#       fill_in "player[username]", with: "aj"
#       fill_in "player[password]", with: "aj"
#       fill_in "player[confirmation_password]", with: "aj"
#       click_on "Create Account"
#
#       expect(current_path).to eq(player_path(aj.id))
#       expect(page).to have_content("AJ")
#       expect(page).to have_content("Randall")
#
#     end
#   end
# end
