require 'rails_helper'

RSpec.feature "admin can" do
  scenario "see dashboard" do
    admin = Admin.create(email: "bill@nye.com", password: "billnye")

    visit '/'

    click_on "Log In"

    click_on "Sign In"

    fill_in "session_email", with: admin.email
    fill_in "session_password", with: "billnye"

    click_on "Log in"

    visit '/dashboard'

    expect(current_path).to eq dashboard_index_path
    expect(page).to have_content("Hello #{admin.first_name}")
  end
end
