require 'rails_helper'

describe "players dashboard" do
  xscenario "a user can log into twitter" do

    #need to update/verify test, currently failing as current_user does not get assigned in test
    #consult with brandonrandall

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      uid: "1234",
      credentials:
        { token: "something",
          secret: "secretsomething"
        }
    })

    visit '/dashboard'

    click_link "Sign in with Twitter"
    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("brandonrandall")

  end
end
