FactoryBot.define do
  factory :game do
    title { Faker::Commerce.material }
    association :user
  end
end
