require 'rails_helper'

RSpec.describe 'Halls requests' do
  let(:hall) { Hall.create!(number: '1', capacity: 500) }

  describe 'GET /halls' do
    it 'returns status 200' do
      get('/halls')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /halls/:id' do
    it 'returns status 200' do
      get("/halls/#{hall.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /halls' do
    it 'returns status 201' do
      post('/halls', params: { hall: { number: '1', capacity: 100 } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /halls/:id' do
    it 'returns status 200' do
      put("/halls/#{hall.id}", params: { hall: { number: '2' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /halls/:id' do
    it 'returns status 204' do
      delete("/halls/#{hall.id}")
      expect(response.status).to eq(204)
    end
  end
end
