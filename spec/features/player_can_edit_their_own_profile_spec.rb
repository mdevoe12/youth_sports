require 'rails_helper'

RSpec.feature 'player visits their own page' do
  describe 'and sees an option to edit their own info' do
    it 'and can edit their info successfully' do
      player = create(:player, :with_profile, type: "Player")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(player)
      visit("/player_profiles/#{player.profile.id}")
      expect(page).to have_content(player.profile.weight)
      expect(page).to have_link("Edit")
      click_link("Edit")
      fill_in "player_profile_weight", with: "200"
      click_on("Update Profile")
      expect(current_path).to eq("/player_profiles/#{player.profile.id}")
      expect(page).to have_content("200lbs")
      expect(page).to_not have_content("105lbs")
    end
    it 'but cannot edit another players info' do
      visit("/player_profiles/#{@player2.profile.id}")
      expect(page).to_not have_content("Edit")
      visit("/players/#{@player2.id}/edit")
      expect(page).to have_content("404")
    end
  end
end
