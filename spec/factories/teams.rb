FactoryGirl.define do
  factory :team do
    sequence :name do |x|
      "Crimson Tide #{x}"
    end

    trait :with_upcoming_games do
      after(:create) do |team|
        games = create_list(:game, 3, status: "upcoming")
        team.games << games
        games.each do |game|
          game.teams << create(:team)
        end
      end
    end
  end
end
