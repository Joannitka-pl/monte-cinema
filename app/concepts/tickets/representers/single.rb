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
    end
  end
end
