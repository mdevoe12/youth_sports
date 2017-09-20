require 'rails_helper'

feature "Recruiter can add and delete a player to a Watchlist" do
  before(:each) do
    @recruiter         = create(:recruiter, :with_profile)
    @player = create(:player, :with_profile, type: "Player")
    @player.teams << create(:team, :with_upcoming_games)
    second_player      = create(:player, :with_profile, type: "Player")
    second_player.teams << create(:team, :with_upcoming_games)
    Game.all.each do |game|
      game.teams << create(:team, name: "Auburn War Eggos")
    end
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@recruiter)
  end

  it "adds and removes players from watchlist" do
    visit player_profile_path(@player.profile)

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
