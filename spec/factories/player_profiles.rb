FactoryGirl.define do
  factory :player_profile do
    school "MySchool"
    height "4ft10in"
    weight "105lbs"
    grade_level 7
    gpa 1.5
    guardian_phone "phone-numba"
    player
  end
end
