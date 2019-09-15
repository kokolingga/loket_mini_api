require 'rails_helper'

RSpec.describe Event, type: :model do
  # Association test
  # ensure an event record belongs to a single location record
  it { should belong_to(:location) }
  it { should have_many(:tickets).dependent(:destroy) }

  # Validation tests
  # ensure each columns are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:event_type) }
  it { should validate_presence_of(:capacity) }
  it { should validate_presence_of(:organizer) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should validate_presence_of(:description) }
end
