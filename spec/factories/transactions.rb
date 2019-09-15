FactoryBot.define do
  factory :transaction do
    customer_id { 1 }
    ticket_id { 1 }
    amount { 1 }
  end
end
