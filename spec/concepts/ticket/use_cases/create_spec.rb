# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tickets::UseCases::Create do
  describe '#call' do
    subject(:create_tickets) { described_class.new(reservation: reservation, tickets: tickets).call }

    let(:reservation) { create(:reservation) }
    let(:tickets) do
      [
        {
          id: 1,
          sort: 'regular',
          price: 20,
          reservation_id: reservation.id,
          seat: 'A1'
        },
        {
          id: 2,
          sort: 'regular',
          price: 20,
          reservation_id: reservation.id,
          seat: 'A2'
        },
        {
          id: 3,
          sort: 'regular',
          price: 20,
          reservation_id: reservation.id,
          seat: 'A3'
        }
      ]
    end

    it 'creates 3 tickets' do
      expect { create_tickets }.to change(Ticket, :count).by(3)
    end

    context 'when adding key to ticket' do
      let(:tickets) do
        [
          {
            id: 3,
            sort: 'regular',
            price: 20,
            reservation_id: reservation.id,
            seat: 'A1'
          }
        ]
      end

      before do
        create_tickets
      end

      it 'saves generated key into db ticket table' do
        expect(Ticket.order('created_at').last.key).to be_a_kind_of(String)
      end
    end
  end
end
