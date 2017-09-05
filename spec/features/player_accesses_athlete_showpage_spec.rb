require 'rails_helper'

RSpec.feature 'user visits athlete showpage' do
  describe 'their own dashboard' do
    it 'sees individualized data with welcome' do
      @athlete = create(:user, :complete, type: "Player")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@athlete)
      visit("/athletes/#{@athlete.id}")
      expect(page).to have_content("Welcome Username")
      expect(page).to have_link("Edit Profile")
    end
  end
  describe 'someone elses dashboard' do
    it 'sees generic data and no welcome' do
      @athlete = create(:user, :complete, type: "Player")
      athlete2 = create(:user, :complete, type: "Player", username: "Different Username")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@athlete)
      visit("/athletes/#{athlete2.id}")

      expect(page).to_not have_content("Welcome Different username")
      expect(page).to have_content(athlete2.first_name)
      expect(page).to_not have_link("Edit Profile")
    end
  end
end
