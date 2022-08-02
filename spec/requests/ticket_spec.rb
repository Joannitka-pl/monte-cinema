# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:admin) { create(:user, role: 'admin') }
  let(:client) { Client.create!(name: 'Jan Kowalski', age: 20, email: 'example@example.com', real_user: false) }
  let(:seance) { Seance.create!(date: '20/10/2020 10:00', hall_id: hall.id, movie_id: movie.id) }
  let(:ticket_desk) { TicketDesk.create!(category: 'online') }
  let(:hall) { Hall.create!(number: '1', capacity: 500) }
  let(:movie) { Movie.create!(title: 'Start Wars', age_limit: '18', duration: '200') }
  let(:user_1) { create(:user) }
  let(:ticket_1) { Ticket.new(sort: 'regular', price: 20, seat: 'A1', key: 'ais73ueir902n.kd') }
  let(:reservation_1) do
    Reservation.create!(status: 'confirmed', client_id: client.id, seance_id: seance.id, ticket_desk_id: ticket_desk.id,
                        user_id: user_1.id, tickets: [ticket_1])
  end
  let(:user_2) { create(:user) }
  let(:ticket_2) { Ticket.new(sort: 'discounted', price: 10, seat: 'B1', key: 'wla8IJw92Ijakw98') }
  let(:reservation_2) do
    Reservation.create!(status: 'confirmed', client_id: client.id, seance_id: seance.id, ticket_desk_id: ticket_desk.id,
                        user_id: user_2.id, tickets: [ticket_2])
  end
  let(:expected_response_for_user) { [{ 'id' => ticket_1.id, 'sort' => 'regular', 'price' => '20.0', 'seat' => 'A1' }] }
  let(:expected_response_for_admin) do
    [
      { 'id' => ticket_1.id, 'sort' => 'regular', 'price' => '20.0', 'seat' => 'A1' },
      { 'id' => ticket_2.id, 'sort' => 'discounted', 'price' => '10.0', 'seat' => 'B1' }
    ]
  end

  before do
    admin
    client
    seance
    ticket_desk
    hall
    movie
    user_1
    user_2
    ticket_1
    ticket_2
    reservation_1
    reservation_2
  end
  context 'when user is regular user' do
    it 'lists resources availabe to user' do
      sign_in user_1
      get :index
      expect(JSON.parse(response.body)).to eq(expected_response_for_user)
    end
  end

  context 'when user is admin' do
    it 'lists all resources' do
      sign_in admin
      get :index
      expect(JSON.parse(response.body)).to eq(expected_response_for_admin)
    end
  end

  context 'when user requests single ticket view' do
    let(:expected_response_for_user) do
      {
        'id' => ticket_2.id,
        'sort' => 'discounted',
        'price' => '10.0',
        'seat' => 'B1'
      }
    end

    it 'shows user single ticket' do
      sign_in user_2
      get :show, params: { id: ticket_2.id }
      expect(JSON.parse(response.body)).to eq(expected_response_for_user)
    end
  end

  context 'when admin requests single ticket view' do
    let(:expected_response_for_admin) do
      {
        'id' => ticket_1.id,
        'sort' => 'regular',
        'price' => '20.0',
        'seat' => 'A1'
      }
    end

    it 'shows single ticket' do
      sign_in admin
      get :show, params: { id: ticket_1.id }
      expect(JSON.parse(response.body)).to eq(expected_response_for_admin)
    end
  end
end
