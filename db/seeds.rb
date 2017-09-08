require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

start = Time.now

Role.create(name: "Player")
Role.create(name: "Coach")
Role.create(name: "Recruiter")
Role.create(name: "Admin")

# admin = Admin.create(first_name: "Josh",
# last_name: "Dao",
# username: "admin@admin.com",
# password_digest: "password")

# admin.roles << Role.find_by(name: "Admin")

Facility.create(
  :name => "Coors field",
  :address => "2001 Blake St, Denver, CO 80205",
  :latitude => 39.755940,
  :longitude => -104.994157,
  )

Facility.create(
  :name => "Pepsi Center",
  :address => "1000 Chopper Cir, Denver, CO 8020",
  :latitude => 39.748676,
  :longitude => -105.007667,
  )

Facility.create(
  :name => "Mile High Stadium",
  :address => "2027 Old West Colfax Ave, Denver, CO 80204",
  :latitude => 39.739938,
  :longitude => -105.016511,
  )

Facility.create(
  :name => "Asbury Elementary",
  :address => "1320 E Asbury Ave, Denver, CO 80210",
  :latitude => 39.680066,
  :longitude => -104.971606,
  )

Facility.create(
  :name => "Calvary Baptist",
  :address => "6500 E Girard Ave, Denver, CO 80224",
  :latitude => 39.653363,
  :longitude => -104.912454,
  )

Facility.create(
  :name => "Carson Elementary",
  :address => "5420 E 1st Ave, Denver, CO 80220",
  :latitude => 39.717422,
  :longitude => -104.924011,
  )

Facility.create(
  :name => "Hamilton Middle School",
  :address => "8600 E Dartmouth Ave, Denver, CO 80231",
  :latitude => 39.659913,
  :longitude => -104.891947,
  )

Facility.create(
  :name => "Heritage Elementary",
  :address => "6867 East Heritage Place, Centennial, CO 80111",
  :latitude => 39.597097,
  :longitude => -104.910516,
  )

Facility.create(
  :name => "Highline Elementary",
  :address => "11000 E Exposition Ave, Aurora, CO 80012",
  :latitude => 39.702919,
  :longitude => -104.858894,
  )

Facility.create(
  :name => "Holm Elementary",
  :address => "3185 S Willow St, Denver, CO 80231",
  :latitude => 39.657640,
  :longitude => -104.892134,
  )

coach_recruiter_count = 1
  100.times do
    team = Team.create(
    name: Faker::Team.name
    )

    coach = Coach.create(
      :first_name => Faker::Name.first_name,
      :last_name  => Faker::Name.last_name,
      :username   => Faker::Internet.safe_email,
      :password   => Faker::Internet.password(8)
    )

    coach.roles << Role.find_by(name: "Coach")

    CoachProfile.create(
      :institution => Faker::GameOfThrones.house,
      :email => Faker::Internet.safe_email,
      :phone_number => "1234545456",
      :coach_id => coach.id
      )

    TeamCoach.create(
      :team_id => team.id,
      :coach_id => coach.id
    )

    recruiter = Recruiter.create(
      :first_name => Faker::Name.first_name,
      :last_name  => Faker::Name.last_name,
      :username   => Faker::Internet.safe_email,
      :password   => Faker::Internet.password(8)
      )

    recruiter.roles << Role.find_by(name: "Recruiter")

    recruiter_profile = RecruiterProfile.create(
      :institution => Faker::GameOfThrones.house,
      :email => Faker::Internet.safe_email,
      :phone_number => "1234545456",
      :recruiter_id => recruiter.id
    )

    puts "creating coach/recruiter #{coach_recruiter_count}"
    coach_recruiter_count +=1
  end


game_count = 1

400.times do
  game = Game.create(
  :facility_id => Facility.pluck(:id).sample,
  :status => rand(0..1),
  :date => Time.now
  )

  2.times do
    GameTeam.create(
    :game_id => game.id,
    :team_id => Team.pluck(:id).sample
    )
  end

  puts "creating game #{game_count}"
  game_count += 1
end

player_count = 1

800.times do
  player = Player.create(
    :first_name => Faker::Name.first_name,
    :last_name  => Faker::Name.last_name,
    :username   => Faker::Internet.safe_email,
    :password   => Faker::Internet.password(8)
  )

  favorite_player = FavoritePlayer.create(screen_name: "@KingJames", player_id: player.id)
  player.roles << Role.find_by(name: "Player")

  player_profile = PlayerProfile.create(
    :school => Faker::HarryPotter.house,
    :height => "#{rand(4...7)} foot #{rand(1...11)} inches",
    :weight => "#{rand(110...250)}",
    :grade_level => rand(1..12),
    :gpa => rand(1.1...4.0).round(2),
    :guardian_phone => "15555555555",
    :player_id => player.id
  )

  PlayerStat.create(
    :points => rand(1..30),
    :fouls => rand(0..5),
    :player_profile_id => player_profile.id,
    :game_id => rand(0..400)
  )

  TeamPlayer.create(
    :team_id => Team.pluck(:id).sample,
    :player_id => player.id
  )
  puts "creating player #{player_count}"
  player_count += 1
end



100.times do
  Prospect.create(
    :recruiter_profile_id => RecruiterProfile.pluck(:id).sample,
    :player_profile_id => PlayerProfile.pluck(:id).sample,
    :status => rand(0..3)
  )
end


end_time = Time.now

puts "It took #{end_time.round(2) - start.round(2)} seconds to seed."
