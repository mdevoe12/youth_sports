require 'rails_helper'

feature "Recruiter can search for athletes based on various attributes" do

  before(:each) do
    @recruiter         = create(:recruiter)
    @recruiter_profile = create(:recruiter_profile, recruiter_id: @recruiter.id)
    @player            = create(:player)
    @player_profile    = create(:player_profile,
                                school: "testschool",
                                height: "78",
                                weight: "230",
                                grade_level: 3,
                                gpa:    3.2,
                                player_id: @player.id)
    @second_player     = create(:player, first_name: "second", last_name: "last")
    @second_profile    = create(:player_profile, player_id: @second_player.id)
    team               = create(:team)
    second_team        = create(:team)
    game               = create(:game)
    second_game        = create(:game)
                         create(:team_player, player_id: @player.id, team_id: team.id)
                         create(:team_player, player_id: @second_player.id, team_id: second_team.id )
                         create(:game_team, game_id: game.id, team_id: team.id)
                         create(:game_team, game_id: game.id, team_id: second_team.id)
                         create(:game_team, game_id: second_game.id, team_id: team.id)
                         create(:game_team, game_id: second_game.id, team_id: second_game.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@recruiter)
  end

  it "finds athletes by aggregate search fields",  :js => true do
    visit player_profiles_path

    expect(page).to have_content("#{@second_player.first_name}")
    expect(page).to have_content("#{@second_profile.school}")

    fill_in "q[player_cont]", with: "#{@player.first_name}"
    fill_in "q[school_cont]", with: "#{@player_profile.school}"
    fill_in "q[grade_level_eq]", with: "#{@player_profile.grade_level}"
    fill_in "q[gpa_gteq]", with: "#{@player_profile.gpa}"
    fill_in "q[height_gteq]", with: "#{@player_profile.height}"
    fill_in "q[weight_gteq]", with: "#{@player_profile.weight}"

    click_button "Search"

    expect(page).to have_content("#{@player.first_name}")
    expect(page).to have_content("#{@player_profile.school}")
    expect(page).to have_content("#{@player_profile.grade_level}")
    expect(page).to have_content("#{@player_profile.gpa}")
    expect(page).to have_content("#{@player_profile.height}")
    expect(page).to have_content("#{@player_profile.weight}")

    expect(page).not_to have_content("#{@second_player.first_name}")
    expect(page).not_to have_content("#{@second_profile.school}")
    expect(page).not_to have_content("#{@second_profile.gpa}")
    expect(page).not_to have_content("#{@second_profile.height}")
    expect(page).not_to have_content("#{@second_profile.weight}")
    end
  end
