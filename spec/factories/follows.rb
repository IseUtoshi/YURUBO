FactoryBot.define do
  factory :follow do
    follower_id { Faker::Number.within(range: 1..10) }
    followee_id { Faker::Number.within(range: 11..20) }
  end
end
