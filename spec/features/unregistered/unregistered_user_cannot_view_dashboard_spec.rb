require 'rails_helper'

RSpec.feature "unregistered user" do
  scenario "cannot view /dashboard" do
    visit '/dashboard'

    expect(page).to have_content('Not Found')
  end
end
