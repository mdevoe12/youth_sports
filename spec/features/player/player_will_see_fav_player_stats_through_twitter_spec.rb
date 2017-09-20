require 'rails_helper'

describe "logged in athlete" do
  scenario "can create their favorite player" do
    aj = create(:player, :with_profile)
    lebron = FavoritePlayer.create(id: 1, full_name: "Lebron James", screen_name: "@KingJames", created_at: "2017-09-07 17:26:58", updated_at: "2017-09-07 17:26:58")
    current_user = allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(aj)

    visit dashboard_index_path

    expect(current_path).to eq("/dashboard")
    expect(page).to have_link("Add your favorite player's screename to see recent tweets")

    click_on ("Add your favorite player's screename to see recent tweets")
    expect(current_path).to eq("/favorite_players/new")

    expect(page).to have_content("Enter Your Favorite Player's Twitter Screen Name To Follow Their Tweets")

    fill_in 'Screen name', with: '@KingJames'
    click_on "submit favorite player screen name"
    current_user

    expect(current_path).to eq("/dashboard")

    aj.reload

    expect(page).to_not have_content('not lebron james')
  end
end
