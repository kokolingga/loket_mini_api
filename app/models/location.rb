class Location < ApplicationRecord
  # Validations
  validates_presence_of :name, :address, :city, :google_map_url
end
