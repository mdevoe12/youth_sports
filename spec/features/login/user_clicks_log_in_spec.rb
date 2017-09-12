require 'rails_helper'

RSpec.describe "User clicks the Log In button in the navbar and" do
  scenario "sees a popup with options to log in with Facebook, Twitter, or default" do
    visit '/'

    click_on("Log In")

    expect(page).to have_content "Log In With Facebook"
    expect(page).to have_button "Log In With Twitter"
    expect(page).to have_link "Sign Up / Create An Account"
  end
end
