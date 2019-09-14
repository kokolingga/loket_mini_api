class Ticket < ApplicationRecord
  # model association
  belongs_to :event

  # validations
  validates_presence_of :name, :amount, :price, :description, :sale_start_date, :sale_end_date
end
