require 'rails_helper'

RSpec.feature "player" do
  scenario "cannot view recruiter profile" do
    player = Player.create(password_digest: 'aj')
    player_profile = PlayerProfile.create(player_id: player.id)
    recr = Recruiter.create(first_name: "harry", last_name: "henderson", password: "123")
    rec_profile = RecruiterProfile.create(recruiter_id: recr.id)
    Prospect.create(player_profile_id: player_profile.id,
                    recruiter_profile_id: rec_profile.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(player)

    visit recruiter_profile_path(rec_profile.id)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
