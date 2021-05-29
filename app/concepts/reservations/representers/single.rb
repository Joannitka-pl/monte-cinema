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
            seance_id: reservation.seance_id
          }
      end
    end
  end
end
