# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tickets::UseCases::ValidateTicket do
  describe '#call' do
    subject(:validate_ticket) { described_class.new(params: params).call }

    let(:seance) { create(:seance, id: 1, date: '2022-07-11 20:40:00') }
    let(:reservation) { create(:reservation, id: 1, seance_id: 1) }
    let(:ticket) { create(:ticket, id: 1, reservation_id: 1, key: key) }
    let(:date_of_client_arrival) { seance.date.advance(minutes: -30) }
    let(:key) { 'UZLdOkzop70Ddx-IJR0ABgdi2839d-k>k2gsi88djw' }
    let(:params) do
      {
        qr_code: {
          id: 1,
          key: key
        }
      }
    end

    before do
      allow(SecureRandom)
        .to receive(:base64)
        .with(32)
        .and_return(key)
      seance
      reservation
      ticket
    end

    context 'when checking valid tiket' do
      it 'validates ticket date' do
        expect(date_of_client_arrival).to be < ticket.reservation.seance.date + 1.hour
      end

      it 'validates qr_code' do
        expect(params[:qr_code]).to eq([[:id, ticket.id], [:key, ticket.key]].to_h)
      end

      it 'validates wether ticket has been used' do
        expect(ticket.used?).to be false
      end

      it 'updates ticket' do
        expect { validate_ticket }.to change(ticket, :used).from(false).to(true)
      end
    end
  end
end
