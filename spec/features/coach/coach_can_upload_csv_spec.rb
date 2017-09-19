require 'rails_helper'

RSpec.feature "A coach" do
  before(:each) do
    @coach = Coach.create(  first_name: "Brandon",
                          last_name: "Randall",
                          password: "123")
    @profile = CoachProfile.create(institution: "Eagles",
                                  email: "1@gmail.com",
                                  phone_number: "123",
                                  coach_id: @coach.id)
    @player1 = Player.create(id: 4,
                            first_name: 'Morty',
                            last_name: 'Smith',
                            username: 'onetruemorty',
                            password_digest: 'ohgeez!')
    @profile1 = PlayerProfile.create(school: 'High School',
                                    height: '5ft4',
                                    weight: '120',
                                    grade_level: 11,
                                    gpa: 3.0,
                                    guardian_phone: '3205555555',
                                    player_id: @player1.id)
    @facility1 = Facility.create(name: "Asbury Elementary")
    @game1 = Game.create(id: 1,
                         facility_id: @facility1.id,
                         status: 1,
                         date: DateTime.new(2017, 10, 10))
    @team1 = Team.create(name: "Old Gregs")
    TeamPlayer.create(team_id: @team1.id, player_id: @player1.id)
    GameTeam.create(game_id: @game1.id, team_id: @team1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@coach)
  end

  scenario "can see upload successful csv" do
    visit "/dashboard"

    expect(page).to have_button("Upload CSV")

    attach_file(:file, 'spec/features/upload_files/good_data.csv')
    click_button "Upload CSV"

    stat = PlayerStat.last

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Items imported")
    expect(stat.points).to eq(6)
    expect(stat.fouls).to eq(4)
    expect(stat.game_id).to eq(1)
  end

  xscenario "uploads bad csv data" do
    visit "/dashboard"

    expect(page).to have_button("Upload CSV")

    attach_file(:file, 'spec/features/upload_files/bad_data.csv')
    click_button "Upload CSV"

    stat = PlayerStat.last

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Error Encountered")
  end
end
