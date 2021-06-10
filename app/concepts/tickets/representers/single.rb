module Tickets
  module Representers
    class Single
      attr_reader :ticket

      def initialize(ticket)
        @ticket = ticket
      end

      def basic
          {
            id: ticket.id,
            sort: ticket.sort,
            price: ticket.price
          }
      end

      def extended
        basic.merge(reservation.seat)
      end

      def reservation
        Reservations::Representers::List.new(ticket).basic
      end
    end
  end
end
