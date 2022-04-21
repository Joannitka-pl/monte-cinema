# frozen_string_literal: true

module Tickets
  module UseCases
    class Create
      attr_reader :tickets, :reservation

      def initialize(reservation:, tickets:)
        @reservation = reservation
        @tickets = tickets
      end

      def call
        tickets.map do |ticket|
          reservation.tickets.create!(ticket.merge!(key: generate_key))
        end
      end

      private

      def generate_key
        SecureRandom.base64(32)
      end
    end
  end
end
