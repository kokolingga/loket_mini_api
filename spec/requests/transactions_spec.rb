require 'rails_helper'

RSpec.describe 'Transactions API', type: :request do
  # Test suite for POST /transaction/purchase
  describe 'POST /transaction/purchase' do
    let!(:location) { create(:location) }
    let!(:event) { create(:event, location_id: location.id) }
    let!(:ticket) { create(:ticket, event_id: event.id) }
    let(:ticket_id) {ticket.id}

    let!(:customer) { create(:customer) }
    let(:customer_id) {customer.id}

    let(:valid_attributes) { { customer_id: customer_id, ticket_id: ticket_id, amount: 1 } }
    let(:invalid_attributes) { { id: "invalid params"} }

    # Test suite for POST /transaction/purchase
    describe 'POST /transaction/purchase' do
      context 'when the request is valid' do
        before { post '/transaction/purchase', params: valid_attributes }

        it 'create a transaction\'s purchase' do
          expect(json['data']['customer_id']).to eq(customer_id)
          expect(json['data']['ticket_id']).to eq(ticket_id)
          expect(json['data']['amount']).to eq(1)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when the request is not valid' do
        before { post '/transaction/purchase', params: invalid_attributes }

        it 'returns status code 200' do
          # 422 can only be generated on database level. we didn't go in there because of ticket's quota validation
          expect(response).to have_http_status(200)
        end

        it 'returns a validation failure message' do
          expect(response.body)
              .to match(/Invalid parameters/)
        end
      end

    end

    # Test suite for GET /transaction/get_info/:customer_id
    describe 'GET /transaction/get_info/:customer_id' do
      before { get "/transaction/get_info/#{customer_id}" }

      context 'when user\'s transaction exists' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'returns the event\'s info' do
          expect(json['data']['id']).to eq(customer_id)
        end
      end
    end
  end
end