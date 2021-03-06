require 'rails_helper'

RSpec.describe Ticket, type: :model do
  # Association test
  # ensure an ticket record belongs to a single event record
  it { should belong_to(:event) }

  # ensure Ticket model has a 1:m relationship with the Transaction model
  it { should have_many(:transactions).dependent(:destroy) }

  # Validation tests
  # ensure each columns are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:sale_start_date) }
  it { should validate_presence_of(:sale_end_date) }
end
