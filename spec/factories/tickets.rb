FactoryBot.define do
  factory :ticket do
    name { Faker::Color.color_name }
    amount { Faker::Number.number(digits: 3) }
    price { Faker::Number.number(digits: 7) }
    description { Faker::Lorem.sentence }
    sale_start_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    sale_end_date { Faker::Date.forward(days: 2) }
    event { nil }
  end
end
