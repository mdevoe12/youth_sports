require 'rails_helper'

RSpec.feature 'registered athlete visits their own show page' do
  describe 'when they land on the dashboard' do
    before (:each) do
      create(:user, :complete, type: 'Player')
      @player = Player.last
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@player)
    end
    it 'they see a welcome header with their username' do
      visit "/athletes/#{@player.id}"
      expect(current_path).to eq("/athletes/#{@player.id}")
      expect(page).to have_content("Welcome #{@player.username.capitalize}")
      expect(page).to have_css("#ath-profile-pic")
    end
    it "they see their own profile info" do
      visit "/athletes/#{@player.id}"
      expect(page).to have_content("#{@player.name}")
      expect(page).to have_content("#{@player.school}")
      expect(page).to have_content("#{@player.grade}")
      expect(page).to have_content("#{@player.height}")
      expect(page).to have_content("#{@player.weight}")
      expect(page).to have_content("#{@player.gpa}")
    end
  end
end
