require 'rails_helper'

RSpec.feature 'user visits athlete showpage' do
  describe 'their own dashboard' do
    it 'sees individualized data with welcome' do
      @athlete = Player.create(username: 'bfav', password: 'password', first_name: 'Brett', last_name: 'Favret')
      PlayerProfile.create(player: @athlete)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@athlete)
      visit("/player_profiles/#{@athlete.profile.id}")
      expect(page).to have_content("Welcome Bfav")
      expect(page).to have_link("Edit Profile")
    end
  end
  describe 'someone elses dashboard' do
    it 'sees generic data and no welcome' do
      @athlete = create(:user, :complete, type: "Player")
      athlete2 = Player.create(username: "Different Username", password: 'pass', first_name: 'fn', last_name: 'ln')
      PlayerProfile.create(player: athlete2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@athlete)
      visit("/player_profiles/#{athlete2.profile.id}")

      expect(page).to_not have_content("Welcome Different username")
      expect(page).to have_content(athlete2.first_name)
      expect(page).to_not have_link("Edit Profile")
    end
  end
end
