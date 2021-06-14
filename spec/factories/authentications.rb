FactoryBot.define do
  factory :authentication do
    uid { SecureRandom.random_number(1000000) }
    provider {'line'}
    user
  end
end
