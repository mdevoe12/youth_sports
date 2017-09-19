require 'rails_helper'

feature "Recruiter can add and delete a player to a Watchlist" do
  before(:each) do
    @recruiter         = create(:recruiter)
    @recruiter_profile = create(:recruiter_profile, recruiter_id: @recruiter.id)
    @player            = create(:player)
    @player_profile    = create(:player_profile, player_id: @player.id)
    second_player      = create(:player)
    second_profile     = create(:player_profile, player_id: second_player.id)
    team               = create(:team)
    second_team        = create(:team)
    game               = create(:game)
    second_game        = create(:game)
                         create(:team_player, player_id: @player.id, team_id: team.id)
                         create(:team_player, player_id: second_player.id, team_id: second_team.id )
                         create(:game_team, game_id: game.id, team_id: team.id)
                         create(:game_team, game_id: second_game.id, team_id: team.id)
                         create(:game_team, game_id: second_game.id, team_id: second_game.id)
                         create(:game_team, game_id: game.id, team_id: second_team.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@recruiter)
  end

  it "adds and removes players from watchlist" do
    visit player_profile_path(@player_profile)

    expect(page).to have_button("Add to Watchlist")

    click_on "Add to Watchlist"

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_content(@player.first_name)
    expect(page).to have_content(@player.last_name)
    expect(page).to have_content("Remove from Watchlist")

    click_link "Remove from Watchlist"

    expect(page).to have_content("0 Potential Recruit")
  end
end
