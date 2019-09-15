class Customer < ApplicationRecord
  # model association
  has_many :purchases, dependent: :destroy
  has_many :transactions, dependent: :destroy

  # validations
  validates_presence_of :first_name, :last_name, :email, :phone
end
