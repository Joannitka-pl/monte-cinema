module Tickets
  module UseCases
    class Create
      attr_reader :tickets, :reservation

      def initialize(reservation:, tickets: [])
        @tickets = tickets
        @reservation = reservation
      end

      def call
        tickets.to_a.each do |ticket|
          @reservation.tickets.create(ticket)
        end
      end
    end
  end
end