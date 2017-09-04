require 'rails_helper'

xdescribe "logged in athlete" do
  scenario "can see their favorite player's tweets" do
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

    visit player_dashboard_path
    expect(current_path).to eq('/player_dashboard')
    save_and_open_page
    expect(page).to have_link("Click to follow your favorite player")
    expect(page).to have_content("#{aj.favorite_player.name}")
    expect(page).to have_content("#{aj.favorite_player.tweets_of_the_week}")
  end
end
