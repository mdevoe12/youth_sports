FactoryGirl.define do
  factory :user do
    type nil
    username 'username'
    password 'password'
    email 'email@email.com'

    trait :complete do
      with_profile
      with_team
    end

    trait :with_profile do
      after(:build) do |user|
        if user.type == 'Player'
          user.first_name = "Larry"
          user.last_name = "Bird"
          user.save
        elsif user.type == 'Coach'
          user.first_name = "Pat"
          user.last_name = "Riley"
          user.save
        end
      end
      after(:create) do |user|
        create(:player_profile, grade_level: 6, gpa: 3.2, guardian_phone: "31700000", height: "4'6in", weight: '105lbs', school: "Haysville Hogs", player_id: user.id)
      end
    end

    trait :with_team do
      after(:create) do
        user = User.last
        team = create(:team, name: "Eagles")
        user.teams << team
      end
    end
  end


end
