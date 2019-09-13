class Event < ApplicationRecord
  # model association
  belongs_to :location

  # validations
  validates_presence_of :name, :category, :event_type, :capacity, :organizer, :start_date, :end_date, :start_time, :end_time, :description
end
