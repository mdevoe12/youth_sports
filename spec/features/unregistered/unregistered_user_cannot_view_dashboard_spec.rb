require 'rails_helper'

RSpec.feature "unregistered user" do
  scenario "cannot view /dashboard" do
    visit '/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist.")
    # expect(visit "/dashboard").to raise_error(ActionController::RoutingError)
  end
end
