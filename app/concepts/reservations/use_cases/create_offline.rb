# frozen_string_literal: true

module Reservations
  module UseCases
    class CreateOffline < Reservations::UseCases::CreateReservationWithTickets
      def call(params:)
        super
        @reservation
      end
    end
  end
end
