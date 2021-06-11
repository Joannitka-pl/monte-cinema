module Reservations
  module UseCases
    class CreateOnline < Reservations::UseCases::CreateReservationWithTickets
      def call(params:)
        super
        @reservation
      end
    end
  end
end