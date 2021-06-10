module Tickets
  module UseCases
    class Create
      attr_reader :ticket_params, :reservation

      def initialize(reservation:, ticket_params: )
        @ticket_params = ticket_params
        @reservation = reservation
      end

      def call
          @reservation.ticket.create!(ticket_params)
      end
    end
  end
end
