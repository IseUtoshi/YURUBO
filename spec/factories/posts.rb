FactoryBot.define do
  factory :post do
    start_time  { Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, format: :default) }
    end_time    { Faker::Time.between_dates(from: DateTime.now + 1, to: DateTime.now + 1, period: :morning, format: :default) }
    chat_id     { Faker::Number.within(range: 2..4) }
    publish_id  { Faker::Number.within(range: 2..4) }
    association :user
  end
end
