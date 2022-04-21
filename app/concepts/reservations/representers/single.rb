module Reservations
  module Representers
    class Single
      attr_reader :reservation

      def initialize(reservation)
        @reservation = reservation
      end

      def basic
        {
          id: reservation.id,
          status: reservation.status,
          client_id: reservation.client_id,
          ticket_desk_id: reservation.ticket_desk_id,
          seance_id: reservation.seance_id,
          seat: reservation.seat
        }
      end

      def extended
        basic.merge(tickets: tickets)
      end

      private

      def tickets
        Tickets::Representers::List.new(reservation.tickets).basic
      end
    end
  end
end
