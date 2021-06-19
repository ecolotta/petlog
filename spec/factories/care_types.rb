FactoryBot.define do
  factory :care_type do
    sequence(:name) { |n| "test_care_type#{n}"}
  end
end
