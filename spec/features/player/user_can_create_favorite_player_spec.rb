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

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(aj)

    visit player_dashboard_path(aj)
    expect(current_path).to eq("/player_dashboard/#{aj.id}")
    expect(page).to have_link("Create/update your favorite player")
    click_on "Create/update your favorite player"

    expect(current_path).to eq(new_favorite_players_path)
    # expect(page).to have_content("#{aj.favorite_player.name}")
    # expect(page).to have_content("#{aj.favorite_player.tweets_of_the_week}")
  end
end
