FactoryBot.define do
  factory :post do
    start_time  { Faker::Time.between_dates(from: DateTime.now + 1, to: DateTime.now + 1, format: :default) }
    end_time    { Time.parse("#{start_time}") + (60 * 30 * Faker::Number.within(range: 1..24)) }
    chat_id     { Faker::Number.within(range: 2..4) }
    publish_id  { Faker::Number.within(range: 2..4) }
    association :user
  end
end
