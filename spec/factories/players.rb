FactoryGirl.define do
  factory :player, parent: :user, class: 'Player' do
    first_name "Derrick"
    last_name "Henry"
  end
end
