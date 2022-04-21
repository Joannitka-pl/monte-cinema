# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tickets::UseCases::GenerateQrCode do
  describe '#call' do
    subject(:call_use_case) { described_class.new.call(ticket[:id]) }

    let(:reservation) { create(:reservation) }
    let(:ticket) { create(:ticket, key: 'ais73ueir902n.kd', reservation: reservation) }
    let(:qr_code) do
      {
        id: ticket.id.to_s,
        key: ticket.key.to_s
      }
    end

    it 'builds qr code from ticket id and key' do
      expect(call_use_case).to eq(qr_code)
    end
  end

  describe '#convert_qr_code' do
    subject(:convert_qr_code) { described_class.new.convert_qr_code(ticket[:id]) }

    let(:reservation) { create(:reservation) }
    let(:ticket) { create(:ticket, key: 'ais73ueir902n.kd', reservation: reservation) }
    let(:qr_code) do
      {
        id: ticket.id,
        key: ticket.key
      }
    end
    let(:converted_qr_code) { RQRCode::QRCode.new(qr_code.to_s) }

    it 'converts qr code to image' do
      expect(convert_qr_code.as_png.to_s(dark: 'E', light: 'Q')).to eq(converted_qr_code)
    end
  end
end
