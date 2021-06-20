# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservations::UseCases::CreateReservationWithTickets do

  let(:instance) { described_class.new }
  let(:ticket_desk) { create :ticket_desk }
  let(:hall) { create :hall }
  let(:movie) { create :movie }
  let(:seance) { create :seance }
  let(:client) { create :client }
  let(:params) do 
    {
      status: 'confirmed',
      client_id: client.id,
      ticket_desk_id: ticket_desk.id,
      seance_id: seance.id,
      seat: 'A9',
      sort: 'full',
      price: '40'
    }
  end

  subject { instance.call(params: params) }

  describe '.call' do
    it 'creates valid reservation' do
      expect { subject }.to change { Reservation.count }.by(1)
    end
  end
end
