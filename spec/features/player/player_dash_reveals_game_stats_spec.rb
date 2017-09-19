require 'rails_helper'

RSpec.feature "registered player views their own dash" do
  describe "and sees a chart" do
    it "matches their last 10 games stats" do
      player = create(:player, :with_profile, type: "Player")
      player.teams << create(:team)
      visit("/player_profiles/#{player.profile.id}")
      expect(page).to have_css("canvas#ath-profile-stats")
    end
  end
end
