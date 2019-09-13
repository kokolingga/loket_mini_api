require 'rails_helper'

RSpec.describe Location, type: :model do
  # Association test
  # ensure Location model has a 1:m relationship with the Event model
  it { should have_many(:events).dependent(:destroy) }

  # Validation tests
  # ensure each columns are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:google_map_url) }
end
