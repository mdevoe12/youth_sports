require 'rails_helper'

describe "a registered player" do
  it "can view their favorite player's tweets" do
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

    visit '/dashboard'

    click_on "Create/update your favorite player"

    fill_in 'screen_name', with: '@KingJames'
    click_on "submit favorite player screen name"

    expect(current_path).to eq("/dashboard/#{aj.id}")
    expect(page).to have_content("#{aj.favorite_player.name}")
    expect(page).to have_content "tweets: #{aj.fav_player.tweets}"

  end
end
