require 'rails_helper'

RSpec.describe Customer, type: :model do
  # Association test
  # ensure Customer model has a 1:m relationship with the Transaction model
  it { should have_many(:transactions).dependent(:destroy) }

  # Validation tests
  # ensure each columns are present before saving
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone) }
end
