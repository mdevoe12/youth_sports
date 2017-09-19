require 'rails_helper'

RSpec.feature 'user visits athlete showpage' do
  describe 'their own dashboard' do
    it 'sees individualized data with welcome' do
      player = create(:player, :with_profile, type: "Player")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(player)
      visit("/player_profiles/#{player.profile.id}")
      expect(page).to have_content("#{player.first_name.upcase}'s STATS")
      expect(page).to have_link("Edit")
    end
  end
  describe 'someone elses dashboard' do
    it 'sees generic data and no welcome' do
      player = create(:player, :with_profile, type: "Player")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(player)
      player_2 = create(:player, :with_profile, email: "derrickhenry@heismanwinners.com", type: "Player")

      visit("/player_profiles/#{player_2.profile.id}")

      expect(page).to have_content("#{player_2.first_name.upcase}'s STATS")
      expect(page).to_not have_link("Edit")
    end
  end
end
