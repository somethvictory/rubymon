FactoryGirl.define do
  factory :user do
    name              FFaker::Name.name
    sequence(:email)  { |i| "testing#{i}@gmail.com" }
    password          FFaker::Name.name
    provider          'facebook'
    sequence(:uid)    { |i| "12344#{i}" }
  end
end
