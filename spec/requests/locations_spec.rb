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

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
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

  # Test suite for POST /locations
  describe 'POST /locations' do
    # valid payload
    let(:valid_attributes) { { name: 'Pasaraya Blok M', address: 'Melawai', city: 'Jakarta', google_map_url: 'https://www.google.com/maps/place/Pasaraya+Blok+M' } }

    context 'when the request is valid' do
      before { post '/location/create', params: valid_attributes }

      it 'creates a location' do
        expect(json['name']).to eq('Pasaraya Blok M')
        expect(json['address']).to eq('Melawai')
        expect(json['city']).to eq('Jakarta')
        expect(json['google_map_url']).to eq('https://www.google.com/maps/place/Pasaraya+Blok+M')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is not valid' do
      before { post '/location/create', params: { title: 'invalid request' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Name can't be blank, Address can't be blank, City can't be blank, Google map url can't be blank/)
      end
    end

  end
end