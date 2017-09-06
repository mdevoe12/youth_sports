require 'rails_helper'

describe 'Player Api Stats endpoint' do
  before(:each) do
    @player = Player.create(username: 'dvog', password: 'password', first_name: 'Brett', last_name: 'Favret')
    PlayerProfile.create(player: @player)
    10.times do
      PlayerStat.create(created_at: "2017-09-05", :points => rand(0..10), :fouls => rand(0..5), player_profile_id: @player.profile.id)
    end
    PlayerStat.create(created_at: "2016-09-05", :points => rand(0..10), :fouls => rand(0..5), player_profile_id: @player.profile.id)
  end
  it 'returns a list of 10 points without a date-range and without a scope' do
    get "/api/v1/players/#{@player.id}/stats"
    expect(response).to be_success
    stats = JSON.parse(response.body)
    expect(stats.count).to eq(10)
    expect(stats.map{|stat| stat['id']}).not_to include(PlayerStat.last.id)
  end
  it 'returns a list of x points based on games scope' do
    get "/api/v1/players/#{@player.id}/stats?games=11"
    expect(response).to be_success
    stats = JSON.parse(response.body)
    expect(stats.count).to eq(11)
  end
  it 'returns as many stats as possible in the event of over-scoping' do
    get "/api/v1/players/#{@player.id}/stats?games=12"
    stats = JSON.parse(response.body)
    expect(stats.count).to eq(11)
  end
end
