require 'rails_helper'

RSpec.describe "Recruiter visits player profile and" do
  scenario "cannot start recruitment player recruitment status is inactive" do
    recruiter = create(:recruiter, :with_profile)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(recruiter)

    player = create(:player, :with_inactive_status)
    player.teams << create(:team, :with_upcoming_games)
    Game.all.each do |game|
      game.teams << create(:team, name: "Auburn War Eggos")
    end
    
    visit player_profile_path(player.profile)

    expect(page).to have_button('Start Recruitment', disabled: true)
  end
end
