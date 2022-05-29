# frozen_string_literal: true

module Tickets
  module UseCases
    class ValidateTicket
      attr_reader :params

      def initialize(params:)
        @params = params
      end

      def call
        check_ticket_date!(received_ticket_id)
        validate_ticket!
      end

      private

      def check_ticket_date!(received_ticket_id)
        ticket = Tickets::Repository.new.show(received_ticket_id)
        raise TicketDateExpired unless DateTime.now < ticket.reservation.seance.date + 1.hour
      end

      def validate_ticket!
        ticket = Tickets::Repository.new.show(received_ticket_id)
        raise QrCodeNotValid unless validate_qr_code(ticket)
        raise TicketAlreadyUsed if ticket.used

        Tickets::UseCases::Update.new.mark_as_used(id: id)
      end

      def qr_code_valid?(ticket)
        received_ticket_id == ticket.id && received_key == ticket.key
      end

      def received_ticket_id
        params[:qr_code][:id]
      end

      def received_key
        params[:qr_code][:key]
      end
    end
  end
end
