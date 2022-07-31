# frozen_string_literal: true

module Reservations
  module UseCases
    class CalculateTotalAmount
      def call(reservation_id)
        Reservation.find(reservation_id)
                   .tickets.map(&:price)
                   .inject(0, :+)
                   .to_i
      end
    end
  end
end
