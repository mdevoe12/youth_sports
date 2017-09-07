require 'rails_helper'

describe 'Player Api points endpoint' do
  before(:each) do
    @player = Player.create(username: 'dvog', password: 'password', first_name: 'Brett', last_name: 'Favret')
    PlayerProfile.create(player: @player)
    10.times do |i|
      Facility.create(name: "Village--#{i}")
      game = Game.create(facility: Facility.last)
      PlayerStat.create(created_at: "2017-09-05", :points => rand(0..10), :fouls => rand(0..5), player_profile_id: @player.profile.id, :game_id => game.id)
    end
    game = Game.create(facility: Facility.first)
    PlayerStat.create(created_at: "2016-09-05", :points => rand(0..10), :fouls => rand(0..5), player_profile_id: @player.profile.id, :game_id => game.id)
  end
  it "it returns list of points" do
    get "/api/v1/players/points?id=#{@player.id}"
    expect(response).to be_success
    points = JSON.parse(response.body)
    expect(points.count).to eq(10)
  end
end
