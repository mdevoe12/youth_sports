require 'rails_helper'

RSpec.feature "unregistered user" do
  scenario "click login and see login page" do
    visit root_path
    click_link("Log In")
    click_link("Sign In")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

end
