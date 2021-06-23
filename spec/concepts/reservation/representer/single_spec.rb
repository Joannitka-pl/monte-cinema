require 'rails_helper'

RSpec.describe Reservations::Representers do
  context 'when representer is used' do
    let(:instance) { Reservations::Representers::Single.new(reservation) }
    let(:reservation) { create :reservation }
    let(:seance) { create :seance }

      describe 'basic representer' do

      it 'displays proper params for basic view' do
        expect(instance.basic).to eq(
          {
            id: reservation.id,
            status: reservation.status,
            client_id: reservation.client_id,
            ticket_desk_id: reservation.ticket_desk_id,
            seance_id: reservation.seance_id,
            seat: reservation.seat
          }
        )
      end
    end

      describe 'extended representer' do

      it 'displays proper params for extended view' do
        expect(instance.extended).to eq(
          {
            id: reservation.id,
            status: reservation.status,
            client_id: reservation.client_id,
            ticket_desk_id: reservation.ticket_desk_id,
            seance_id: reservation.seance_id,
            seat: reservation.seat,
            tickets: reservation.tickets
          }
        )
      end
    end
  end
end