module TicketDesks
  module Representers
    class Single
      attr_reader :ticket_desk

      def initialize(ticket_desk)
        @ticket_desk = ticket_desk
      end

      def basic
        {
          id: ticket_desk.id,
          category: ticket_desk.category
        }
      end
    end
  end
end
