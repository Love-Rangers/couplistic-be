FactoryBot.define do
  factory :random_event, class: Event do
    name { Faker::Book.title }
    start_time { Faker::Date.in_date_period(month: 6) }
    location { Faker::Restaurant.name }
    user_id { Faker::Number.number(digits: 3) }
  end
end
