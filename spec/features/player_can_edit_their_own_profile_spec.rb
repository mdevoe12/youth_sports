require 'rails_helper'

RSpec.feature 'player visits their own page' do
  describe 'and sees an option to edit their own info' do
    before(:each) do
      @player = create(:user, :complete, type: 'Player')
      @player2 = create(:user, :complete, type: 'Player', username: 'Jacus34')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@player)
    end
    it 'and can edit their info successfully' do
      visit("/athletes/#{@player.id}")
      expect(page).to have_content("105lbs")
      expect(page).to have_link("Edit Profile")
      click_link("Edit Profile")
      fill_in "player_profile_weight", with: "200lbs"
      click_on("Update Profile")
      expect(current_path).to eq(player_path)
      expect(page).to have_content("200lbs")
      expect(page).to_not have_content("105lbs")
    end
    it 'but cannot edit another players info' do
      visit("/athletes/#{@player2.id}")
      expect(page).to_not have_content("Edit Profile")
      visit("/athletes/#{@player2.id}/edit")
      expect(page).to have_content("404")
    end
  end
end
