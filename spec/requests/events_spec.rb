require 'rails_helper'

RSpec.describe 'Events API' do
  # initialize test data
  let!(:location) { create(:location) }
  let!(:events) { create_list(:event, 2, location_id: location.id) }
  let!(:tickets) { create_list(:ticket, 2, event_id: events.first.id) }
  let(:location_id) { location.id }
  let(:id) {events.first.id}

  # Test suite for GET /locations/:location_id/events
  describe 'GET /locations/:location_id/events' do
    before { get "/locations/#{location_id}/events" }

    context 'when location exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all location events' do
        expect(json.size).to eq(2)
      end
    end

    context 'when location does not exist' do
      let(:location_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Location/)
      end
    end
  end

  # Test suite for GET /locations/:location_id/events/:id
  describe 'GET /locations/:location_id/events/:id' do
    before { get "/locations/#{location_id}/events/#{id}" }

    context 'when Location\'s event exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the event' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when Location\'s event does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Event/)
      end
    end
  end

  # Test suite for POST /locations/:location_id/events
  describe 'POST /locations/:location_id/events' do
    let(:valid_attributes) {
      {
          name: 'LAUV TOUR 2019',
          category: "Public",
          event_type: "Concert",
          capacity: 500,
          organizer: "CUBE Ent",
          start_date: "2019-10-10",
          end_date: "2019-10-11",
          start_time: "15:00:00",
          end_time: "02:00:00",
          description: "LAUV TOUR 2019"
      }
    }

    context 'when request attributes are valid' do
      before { post "/locations/#{location_id}/events", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/locations/#{location_id}/events", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for GET /locations/:location_id/events/:id/get_info
  describe 'GET /locations/:location_id/events/:id/get_info' do
    before { get "/locations/#{location_id}/events/#{id}/get_info" }

    context 'when event exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the event\'s info' do
        expect(json['data']['id']).to eq(id)
      end
    end

    context 'when event does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Event/)
      end
    end
  end
end