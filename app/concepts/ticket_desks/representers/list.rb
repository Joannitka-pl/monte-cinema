# frozen_string_literal: true

module TicketDesks
  module Representers
    class List
      attr_reader :ticket_desks

      def initialize(ticket_desks)
        @ticket_desks = ticket_desks
      end

      def basic
        ticket_desks.map do |ticket_desk|
          Single.new(ticket_desk).basic
        end
      end
    end
  end
end
