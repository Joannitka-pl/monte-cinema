# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  let(:client) { Client.create!(name: 'Jan Kowalski', age: 20, email: 'example@example.com', real_user: false) }

  describe 'GET /clients' do
    it 'returns status 200' do
      get('/clients')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /clients/:id' do
    it 'returns status 200' do
      get("/clients/#{client.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /clients' do
    it 'returns status 201' do
      post('/clients',
           params: { client: { name: 'Jan Kowalski', age: 20, email: 'example@example.com', real_user: false } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /clients/:id' do
    it 'returns status 200' do
      put("/clients/#{client.id}",
          params: { client: { name: 'Anna Nowak', age: 12, email: 'anna@example.com', real_user: false } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /clients/:id' do
    it 'returns status 204' do
      delete("/clients/#{client.id}")
      expect(response.status).to eq(204)
    end
  end
end
