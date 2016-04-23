FactoryGirl.define do
  factory :monster do
    name FFaker::Name.name
    power FFaker::Name.name

    association :monster_type
    association :user
  end
end
