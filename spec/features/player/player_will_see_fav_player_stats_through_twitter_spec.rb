require 'rails_helper'

describe "logged in athlete" do
  scenario "can create their favorite player" do
    aj = Player.create(first_name: 'AJ',
                            last_name: 'Randall',
                            username: 'aj',
                            password_digest: 'aj')

    aj_profile = PlayerProfile.create(school: 'Hamilton Middle School',
                                    height: '4ft10',
                                    weight: '90',
                                    grade_level: 6,
                                    gpa: 4.0,
                                    guardian_phone: '7202436470',
                                    player_id: aj.id)

    lebron = FavoritePlayer.create(id: 1, full_name: "Lebron James", screen_name: "@KingJames", created_at: "2017-09-07 17:26:58", updated_at: "2017-09-07 17:26:58")

    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(aj)

    # NEED TO CREATE/CLEAN UP SPEC FOR USER CREATNG PROFILE

    visit dashboard_index_path
    # visit dashboard_path(aj)
    # expect(current_path).to eq("/dashboard/#{aj.id}")
    expect(current_path).to eq("/dashboard")
    expect(page).to have_link("Add your favorite player's screename to see recent tweets")
    click_on ("Add your favorite player's screename to see recent tweets")
    expect(current_path).to eq("/favorite_players/new")

    expect(page).to have_content("Enter Your Favorite Player's Twitter Screen Name To Follow Their Tweets")
    fill_in 'Screen name', with: '@KingJames'
    click_on "submit favorite player screen name"
    expect(current_path).to eq("/dashboard")
    aj.reload
    #limit/check for the number of tweets and wrap in vcr
    # save_and_open_page
    # binding.pry
    expect(page).to have_content("Favorite Player: #{aj.favorite_player.screen_name}")
    # expect(page).to have_content "tweets: #{aj.favorite_player.tweets}"
    expect(page).to have_content(aj.favorite_player.plus_minus)
  end
end
