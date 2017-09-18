require 'rails_helper'

RSpec.feature "admin can" do
  scenario "see dashboard" do
    admin = Admin.create(email: "bill@nye.com", password: "billnye")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/dashboard'

    expect(page).to have_content(admin.first_name)
  end
end
