# frozen_string_literal: true

module Tickets
  module UseCases
    class GenerateQrCode
      def call(ticket_id)
        {
          id: ticket_id,
          key: Ticket.find_by(id: ticket_id).key
        }
      end
    end
  end
end
