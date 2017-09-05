start = Time.now

Role.create(name: "Player")
Role.create(name: "Coach")
Role.create(name: "Recruiter")
Role.create(name: "Admin")

40.times do
    team = Team.create(
    name: Faker::Team.name
    )
end

100.times do
  game = Game.create(
  :facility_id => ,
  :status => rand(0..1),
  :date => Time.now
  )

  
end


player_count = 1
500.times do
  player = Player.create(
    :first_name => Faker::Name.first_name,
    :last_name  => Faker::Name.last_name,
    :username   => Faker::Internet.safe_email,
    :password   => Faker::Internet.password(8)
  )

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
    :player_profile_id => player_profile.id
  )

  TeamPlayer.create(
    :team_id => Team.pluck(:id).sample,
    :player_id => player.id
  )
  puts "creating player #{player_count}"
  player_count += 1
end

coach_recruiter_count = 1
40.times do
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
    :team_id => Team.pluck(:id).sample,
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

    Prospect.create(
      :recruiter_profile_id => recruiter_profile.id,
      :player_profile_id => Player.pluck(:id).sample,
      :status => rand(0..3)
    )

  puts "creating coach/recruiter #{coach_recruiter_count}"
  coach_recruiter_count +=1
end

end_time = Time.now

puts "#{end_time - start}"
