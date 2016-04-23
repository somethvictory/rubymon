FactoryGirl.define do
  factory :monster_team do
    sequence(:name) { |i| "#{i} #{FFaker::Name.name}"  }

    association :user
  end
end
