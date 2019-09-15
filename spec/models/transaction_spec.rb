require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # Validation tests
  # ensure each columns are present before saving
  it { should validate_presence_of(:customer_id) }
  it { should validate_presence_of(:ticket_id) }
  it { should validate_presence_of(:amount) }
end
