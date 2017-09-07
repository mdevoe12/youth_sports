require 'rails_helper'

describe 'Player Api Stats endpoint' do
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
  end
  it 'cannot return a list without :id' do
    get "/api/v1/players/stats"
    expect(response).to be_success
    expect(response.body).to include("404")
  end
  it 'returns a list of 10 points without a scope' do
    get "/api/v1/players/stats?id=#{@player.id}"
    expect(response).to be_success
    stats = JSON.parse(response.body)
    expect(stats['fouls'].count).to eq(10)
    expect(stats['points'].count).to eq(10)
    expect(stats['points'].keys).not_to include("11")
  end
  it 'returns a list of x points based on games scope' do
    get "/api/v1/players/stats?id=#{@player.id}&games=11"
    expect(response).to be_success
    stats = JSON.parse(response.body)
    expect(stats['points'].count).to eq(11)
    expect(stats['fouls'].count).to eq(11)
  end
  it 'returns as many stats as possible in the event of over-scoping' do
    get "/api/v1/players/stats?id=#{@player.id}&games=12"
    stats = JSON.parse(response.body)
    expect(stats['points'].count).to eq(11)
  end
end
