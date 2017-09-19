FactoryGirl.define do
  factory :user_authentication do
    user
    authentication_provider
    uid 12345678
    token "a1b1c1d1"
    token_expires_at "LOL"
  end
end
