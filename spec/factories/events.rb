FactoryBot.define do
  factory :event do
    name { Faker::Sports::Football.competition }
    category { Faker::Movies::HarryPotter.house }
    event_type { "Public" }
    capacity { Faker::Number.number(digits: 3) }
    organizer { Faker::Company.name }
    start_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    end_date { Faker::Date.forward(days: 2) }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_time { Faker::Time.forward(days: 2, period: :morning) }
    location_id { nil }
    description { Faker::Lorem.sentence }
  end
end
