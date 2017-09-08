require 'rails_helper'

RSpec.feature "registered player views their own dash" do
  describe "and sees a chart" do
    before(:each) do
      @player = Player.create(username: 'dvog', password: 'password', first_name: 'Brett', last_name: 'Favret')
      PlayerProfile.create(player: @player)
      @facility = create(:facility)
      10.times do
        game = create(:game, facility: @facility)
        PlayerStat.create(created_at: "2017-09-05", :points => rand(0..10), :fouls => rand(0..5), player_profile_id: @player.profile.id, game_id: game.id)
      end
      game = create(:game, facility: @facility)
      PlayerStat.create(created_at: "2016-09-05", :points => 11, :fouls => rand(0..5), player_profile_id: @player.profile.id, game_id: game.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@player)
    end
    it "matches their last 10 games stats" do
      visit("/player_profiles/#{@player.profile.id}")
      expect(page).to have_css("canvas#ath-profile-stats")
    end
  end
end
