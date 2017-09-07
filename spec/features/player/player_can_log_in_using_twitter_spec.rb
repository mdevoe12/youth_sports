require 'rails_helper'

describe "players dashboard" do
  scenario "a user can log into twitter" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      uid: "1234",
      credentials:
        { token: "something",
          secret: "secretsomething"
        }
    })
    
    visit player_dashboard_path
    click_link "Sign in with Twitter"
    expect(current_path).to eq(player_dashboard_path)
    expect(page).to have_content("brandonrandall")

  end
end
