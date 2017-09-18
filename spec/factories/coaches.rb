FactoryGirl.define do
  factory :coach, parent: :user, class: 'Coach' do

    first_name "Nick"
    last_name "Saban"

    trait :with_profile do
      after(:create) do |coach|
        coach_profile = create :coach_profile, institution: "Hogwarts", email: "hagrid@hogwarts.net", phone_number: "1234567890", coach: coach
        coach.profile = coach_profile
      end
    end
  end
end
