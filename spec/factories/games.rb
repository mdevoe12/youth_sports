FactoryGirl.define do
  factory :game do
    facility
    status 1
    date DateTime.now

    trait :with_teams do
      after(:create) do |game|
        teams = create_list(:team, 3)
        game.teams << teams
      end
    end
  end
end
