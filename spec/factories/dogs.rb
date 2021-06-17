FactoryBot.define do
  factory :dog do
    sequence(:name) { |n| "test_dog#{n}" }
    birthday { Faker::Date.birthday }
    association :user
  end
end
