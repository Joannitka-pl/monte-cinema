# frozen_string_literal: true

require 'pundit/rspec'
require 'rails_helper'

describe TicketPolicy do
  subject { described_class.new(user, ticket) }

  let(:client) { Client.create!(name: 'Jan Kowalski', age: 20, email: 'example@example.com', real_user: false) }
  let(:seance) { Seance.create!(date: '20/10/2020 10:00', hall_id: hall.id, movie_id: movie.id) }
  let(:ticket_desk) { TicketDesk.create!(category: 'online') }
  let(:hall) { Hall.create!(number: '1', capacity: 500) }
  let(:movie) { Movie.create!(title: 'Start Wars', age_limit: '18', duration: '200') }
  let(:ticket) { Ticket.new(id: 1, sort: 'regular', price: 20, seat: 'A1', key: 'ais73ueir902n.kd') }
  let(:reservation) do
    Reservation.create(
      status: 'confirmed',
      client_id: client.id,
      seance_id: seance.id,
      ticket_desk_id: ticket_desk.id,
      tickets: [ticket]
    )
  end

  context 'when user role is ticket_checker' do
    let(:user) { User.create(role: 'ticket_checker') }

    it { is_expected.to permit_action(:validate_ticket) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'when user is admin' do
    let(:user) { User.create(role: 'admin') }

    it { is_expected.to permit_action(:destroy) }
  end
end
