require 'rails_helper'

RSpec.describe 'TicketDesk requests' do
  let(:ticket_desk) { TicketDesk.create!(category: 'offline', number: '1') }

  describe 'GET /ticket_desks' do
    it 'returns status 200' do
      get('/ticket_desks')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /ticket_desks/:id' do
    it 'returns status 200' do
      get("/ticket_desks/#{ticket_desk.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /ticket_desks' do
    it 'returns status 201' do
      post('/ticket_desks', params: { ticket_desk: { category: 'offline', number: '1' } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /ticket_desks/:id' do
    it 'returns status 200' do
      put("/ticket_desks/#{ticket_desk.id}", params: { ticket_desk: { number: '2' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /ticket_desks/:id' do
    it 'returns status 204' do
      delete("/ticket_desks/#{ticket_desk.id}")
      expect(response.status).to eq(204)
    end
  end
end
