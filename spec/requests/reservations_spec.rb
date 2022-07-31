# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  let(:client) { Client.create!(name: 'Jan Kowalski', age: 20, email: 'example@example.com', real_user: false) }
  let(:seance) { Seance.create!(date: '20/10/2020 10:00', hall_id: hall.id, movie_id: movie.id) }
  let(:ticket_desk) { TicketDesk.create!(category: 'online') }
  let(:hall) { Hall.create!(number: '1', capacity: 500) }
  let(:movie) { Movie.create!(title: 'Start Wars', age_limit: '18', duration: '200') }
  let(:ticket_1) { Ticket.new(id: 1, sort: 'regular', price: 20, seat: 'A1', key: 'ais73ueir902n.kd') }
  let(:reservation) do
    Reservation.create!(status: 'confirmed', client_id: client.id, seance_id: seance.id, ticket_desk_id: ticket_desk.id,
                        tickets: [ticket_1])
  end

  describe 'GET /reservations' do
    it 'returns status 200' do
      get('/reservations')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /reservations/:id' do
    it 'returns status 200' do
      get("/reservations/#{reservation.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /reservations' do
    it 'returns status 201' do
      post('/reservations/online',
           params: { reservation: { status: 'confirmed', client_id: client.id, seance_id: seance.id,
                                    ticket_desk_id: ticket_desk.id, seat: 'A5' } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /reservations/:id' do
    it 'returns status 200' do
      put("/reservations/#{reservation.id}",
          params: { reservation: { status: 'confirmed', client_id: client.id, seance_id: seance.id,
                                   ticket_desk_id: ticket_desk.id } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /reservations/:id' do
    it 'returns status 204' do
      delete("/reservations/#{reservation.id}")
      expect(response.status).to eq(204)
    end
  end
end
