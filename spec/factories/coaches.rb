FactoryGirl.define do
  factory :coach, parent: :user, class: 'Coach' do

    first_name "Nick"
    last_name "Saban"

    trait :with_profile do
      after(:create) do |coach|
        create(:coach_profile, email: "satan@crimson.ua.edu", institution: "ALABAMA ROLL TIDE", phone_number: "1234567890", coach: coach)
      end
    end
  end
end
