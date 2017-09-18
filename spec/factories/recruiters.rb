FactoryGirl.define do
  factory :recruiter, parent: :user, class: 'Recruiter' do

    trait :with_profile do
      after(:create) do |recruiter|
        recruiter_profile = create :recruiter_profile,
                                first_name: "Nick",
                                last_name: "Saban",
                                institution: "ALABAMA ROLL TIDE",
                                email: "satan@crimson.ua.edu",
                                phone_number: "1234567890",
                                recruiter: recruiter

        recruiter.profile = recruiter_profile
      end
    end

    trait :with_prospects do
      after(:create) do |recruiter|
        prospects = create_list(:prospect, 3)
        recruiter.prospects << prospects
      end
    end
  end
end
