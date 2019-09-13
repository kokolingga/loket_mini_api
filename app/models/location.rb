class Location < ApplicationRecord
  # model association
  has_many :events, dependent: :destroy

  # Validations
  validates_presence_of :name, :address, :city, :google_map_url
end
