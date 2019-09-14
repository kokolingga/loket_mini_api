require 'rails_helper'

RSpec.describe 'Events API' do
  # initialize test data
  let!(:location) { create(:location) }
  let!(:event) { create(:event, location_id: location.id) }
  let!(:tickets) { create_list(:ticket, 2, event_id: event.id) }
  let(:event_id) { event.id }
  let(:id) {tickets.first.id}

  # Test suite for GET /events/:event_id/tickets
  describe 'GET /events/:event_id/tickets' do
    before { get "/events/#{event_id}/tickets" }

    context 'when event exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all event\'s tickets' do
        expect(json.size).to eq(2)
      end
    end

    context 'when event does not exist' do
      let(:event_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Event/)
      end
    end
  end

  # Test suite for GET /events/:event_id/tickets/:id
  describe 'GET /events/:event_id/tickets/:id' do
    before { get "/events/#{event_id}/tickets/#{id}" }

    context 'when Event\'s ticket exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the ticket' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when Event\'s ticket does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Ticket/)
      end
    end
  end

  # Test suite for POST /events/:event_id/tickets
  describe 'POST /events/:event_id/tickets' do
    let(:valid_attributes) {
      {
          name: 'Diamond Ticket',
          amount: 100,
          price: 1500000,
          description: 'Diamont Ticket',
          sale_start_date:"2019-09-10",
          sale_end_date:"2019-10-01"
      }
    }

    context 'when request attributes are valid' do
      before { post "/events/#{event_id}/tickets", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/events/#{event_id}/tickets", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

end