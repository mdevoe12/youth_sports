require 'rails_helper'

RSpec.feature "admin can" do
  scenario "seed dashboard" do
    admin = Admin.create(first_name: "Bill",
                         last_name: "Nye",
                         password_digest: "123")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/dashboard'

    expect(page).to have_content(admin.first_name)
  end
end
