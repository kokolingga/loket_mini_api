require 'rails_helper'

RSpec.describe Location, type: :model do
  # Validation tests
  # ensure each columns are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:google_map_url) }
end
