# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tickets::UseCases::GenerateQrCode do
  describe '#call' do
    subject(:call_use_case) { described_class.new.call(ticket[:id]) }

    let(:reservation) { create(:reservation) }
    let(:ticket) { create(:ticket, key: 'ais73ueir902n.kd', reservation: reservation) }
    let(:qr_code) do
      {
        id: ticket.id,
        key: ticket.key
      }
    end

    it 'builds qr code from ticket id and key' do
      expect(call_use_case).to eq(qr_code)
    end
  end
end
