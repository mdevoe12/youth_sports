require 'rails_helper'

RSpec.feature 'player visits their own page' do
  describe 'and sees an option to edit their own info' do
    before(:each) do
      @player = Player.create(username: "user", password: 'password', first_name: 'Jax', last_name: "Anders")
      player_profile = create(:player_profile, player_id: @player.id)
      @player2 = Player.create(username: "Jacus34", password: 'pass', first_name: "Leonard", last_name: "Marx")
      player2_profile = create(:player_profile, player_id: @player2.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@player)
    end
    it 'and can edit their info successfully' do
      visit("/player_profiles/#{@player.profile.id}")
      expect(page).to have_content("105lbs")
      expect(page).to have_link("Edit Profile")
      click_link("Edit Profile")
      fill_in "player_profile_weight", with: "200lbs"
      click_on("Update Profile")
      expect(current_path).to eq("/player_profiles/#{@player.profile.id}")
      expect(page).to have_content("200lbs")
      expect(page).to_not have_content("105lbs")
    end
    it 'but cannot edit another players info' do
      visit("/player_profiles/#{@player2.profile.id}")
      expect(page).to_not have_content("Edit Profile")
      visit("/players/#{@player2.id}/edit")
      expect(page).to have_content("404")
    end
  end
end
