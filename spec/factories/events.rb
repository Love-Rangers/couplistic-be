FactoryBot.define do
  factory :random_event, class: Event do
    name { Faker::Book.title }
    start_time { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
    location { Faker::Restaurant.name }
    user_id { Faker::Number.number(digits: 3) }
  end
end
