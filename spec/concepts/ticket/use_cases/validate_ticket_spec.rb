# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tickets::UseCases::ValidateTicket do
  describe '#call' do
    subject(:validate_ticket) { described_class.new(params: params) }

    let(:seance) { create(:seance, id: 1, date: '2022-07-11 20:40:00') }
    let(:ticket) { Ticket.new(id: 1, key: key) }
    let(:reservation) { create(:reservation, id: 1, seance_id: 1, tickets: [ticket]) }
    let(:date_of_client_arrival) { DateTime.now }
    let(:key) { 'UZLdOkzop70Ddx-IJR0ABgdi2839d-k>k2gsi88djw' }
    let(:params) do
      {
        qr_code: {
          id: 1,
          key: key
        }
      }
    end
    let(:invalid_date_error) { ::Tickets::Errors::TicketDateExpired }
    let(:invalid_qr_code_error) { ::Tickets::Errors::QrCodeNotValid }
    let(:ticket_used_error) { ::Tickets::Errors::TicketAlreadyUsed }

    before do
      allow(SecureRandom)
        .to receive(:base64)
        .with(32)
        .and_return(key)
      seance
      reservation
      ticket
      travel_to Time.zone.local(2022, 07, 11, 20, 10, 00)
    end
    after do
      travel_back
    end

    context 'when checking valid tiket' do
      it 'validates ticket date, qr_code and used value' do
        expect { validate_ticket.call }.not_to raise_error
      end

      it 'updates ticket' do
        expect { validate_ticket.call }.to change { ticket.reload.used }.from(false).to(true)
      end
    end

    context 'when client arrives on a wrong day' do
      before do
        travel_to Time.zone.local(2022, 07, 12, 20, 10, 00)
      end

      it 'raises invalid date error' do
        expect { validate_ticket.call }.to raise_error(invalid_date_error)
      end
    end

    context 'when received qr code is invalid' do
      let(:params) do
        {
          qr_code: {
            id: 1,
            key: '222'
          }
        }
      end

      it 'raises invalid qr code error' do
        expect { validate_ticket.call }.to raise_error(invalid_qr_code_error)
      end
    end

    context 'when ticket is already used' do
      let(:ticket) { Ticket.new(id: 1, key: key, used: true) }
      let(:reservation) { create(:reservation, id: 1, seance_id: 1, tickets: [ticket]) }

      before do
        seance
        reservation
        ticket
      end
      it 'raises ticket already used error' do
        expect { validate_ticket.call }.to raise_error(ticket_used_error)
      end
    end
  end
end
