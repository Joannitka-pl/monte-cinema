# frozen_string_literal: true

require 'rqrcode'
require 'rqrcode/export/png'

module Tickets
  module UseCases
    class GenerateQrCode
      def call(ticket_id)
        string = ticket_values(ticket_id)
        RQRCode::QRCode.new(string)
      end

      private

      def ticket_values(ticket_id)
        {
          id: ticket_id,
          key: Ticket::Repository.new.show(ticket_id).key
        }.to_json
      end
    end
  end
end
