require 'rails_helper'

RSpec.feature 'player visits their own page' do
  describe 'and sees an option to edit their own info' do
    it 'and can edit their info successfully' do
      player = create(:player, :with_profile, type: "Player")
      player.teams << create(:team, :with_upcoming_games)
      Game.all.each do |game|
        game.teams << create(:team, name: "Auburn War Eggos")
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(player)
      visit("/player_profiles/#{player.profile.id}")
      expect(page).to have_content(player.profile.weight)
      expect(page).to have_link("Edit")
      click_link("Edit")
      fill_in "player_profile_weight", with: "200"
      click_on("Update Profile")
      expect(current_path).to eq("/player_profiles/#{player.profile.id}")
      expect(page).to have_content("200")
      expect(page).to_not have_content("105")
    end
    it 'but cannot edit another players info' do
      player = create(:player, :with_profile, type: "Player")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(player)
      player_2 = create(:player, :with_profile, email: "derrickhenry@heismanwinners.com", type: "Player")
      player = create(:player, :with_profile, type: "Player")
      player_2.teams << create(:team, :with_upcoming_games)
      Game.all.each do |game|
        game.teams << create(:team, name: "Auburn War Eggos")
      end

      visit("/player_profiles/#{player_2.profile.id}")
      expect(page).to_not have_content("Edit")
      visit("/players/#{player_2.id}/edit")
      expect(page).to have_content("404")
    end
  end
end
