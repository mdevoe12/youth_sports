FactoryGirl.define do
  factory :player, parent: :user, class: 'Player' do
    first_name "Derrick"
    last_name "Henry"
    type "Player"



    trait :with_profile do
      after(:create) do |player|
        player_profile = create :player_profile,
                                school: "Hogwarts",
                                height: "1",
                                weight: "2",
                                grade_level: 3,
                                gpa: 1.0,
                                guardian_phone: "1234567890",
                                player: player

        player.profile = player_profile
      end
    end
  end
end
