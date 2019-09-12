require 'rails_helper'

RSpec.describe 'Locations API', type: :request do
  # initialize test data
  let!(:locations) { create_list(:location, 5) }
  let(:location_id) { locations.first.id }

  # Test suite for GET /locations
  describe 'GET /locations' do
    # make HTTP get request before each example
    before { get '/locations' }

    it 'returns locations' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /locations/:id
  describe 'GET /locations/:id' do
    before { get "/locations/#{location_id}" }

    context 'when the record exists' do
      it 'returns the location' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(location_id)
      end
    end

    context 'when the record does not exists' do
      let(:location_id) { 123 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Location/)
      end
    end
  end
end