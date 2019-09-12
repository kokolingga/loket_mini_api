FactoryBot.define do
  factory :location do
    name { Faker::Lorem.word }
    address { Faker::Address.full_address }
    city { Faker::Address.city }
    google_map_url { Faker::Address.latitude }
  end
end