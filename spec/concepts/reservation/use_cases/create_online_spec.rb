# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservations::UseCases::CreateOnline do
  describe '.call' do
    let(:instance) { described_class.new(params: params) }
    let(:call_use_case) { instance.call }
    let(:online_ticket_desk) { create :ticket_desk, number: 0 }
    let(:hall) { create :hall }
    let(:movie) { create :movie }
    let(:seance) { create :seance }
    let(:client) { create :client }
    let(:reservation) { create :reservation }
    let(:ticket1) { create :ticket, reservation_id: reservation.id }
    let(:ticket2) { create :ticket, reservation_id: reservation.id }
    let(:tickets) do
      [ticket1, ticket2]
    end
    let(:params) do
      {
        status: 'confirmed',
        client_id: client.id,
        ticket_desk: online_ticket_desk,
        seance_id: seance.id,
        tickets: tickets
      }
    end

    context 'when creating online reservation' do
      it 'creates valid reservation with tickets' do
        expect { call_use_case }.to change(Reservation, :count).by(1)
      end
    end
  end
end
