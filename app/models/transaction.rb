class Transaction < ApplicationRecord
  # model association
  belongs_to :customer
  belongs_to :ticket

  # validations
  validates_presence_of :customer_id, :ticket_id, :amount

end
