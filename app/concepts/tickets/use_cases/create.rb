# frozen_string_literal: true

module Tickets
  module UseCases
    class Create
      def call(reservation:, tickets:)
        tickets.tap do |ticket|
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
