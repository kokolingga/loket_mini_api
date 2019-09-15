require 'rails_helper'

RSpec.describe 'Customers API', type: :request do
  # initialize test data
  let!(:customers) { create_list(:customer, 5) }
  let(:customer_id) { customers.first.id }

  # Test suite for GET /customers
  describe 'GET /customers' do
    # make HTTP get request before each example
    before { get '/customers' }

    it 'returns customers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /customers/:id
  describe 'GET /customers/:id' do
    before { get "/customers/#{customer_id}" }

    context 'when the record exists' do
      it 'returns the customer' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(customer_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exists' do
      let(:customer_id) { 123 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Customer/)
      end
    end
  end

  # Test suite for POST /customer/create
  describe 'POST /customer/create' do
    # valid payload
    let(:valid_attributes) {
      {
          first_name: 'Koko',
          last_name: 'Lingga',
          email: 'koko.lingga@gmail.com',
          phone: '+6282188887777'
      }
    }

    context 'when the request is valid' do
      before { post '/customer/create', params: valid_attributes }

      it 'creates a customer' do
        expect(json['first_name']).to eq('Koko')
        expect(json['last_name']).to eq('Lingga')
        expect(json['email']).to eq('koko.lingga@gmail.com')
        expect(json['phone']).to eq('+6282188887777')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is not valid' do
      before { post '/customer/create', params: { title: 'invalid request' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: First name can't be blank, Last name can't be blank, Email can't be blank, Phone can't be blank/)
      end
    end

  end

end