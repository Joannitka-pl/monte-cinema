module Reservations
  module UseCases
    class CreateOnline < Reservations::UseCases::CreateReservationWithTickets
      def call(params:)
        super
        cancel_expired_reservation
        @reservation
      end

      private

      def cancel_expired_reservation
        CancelReservationJob.set(wait_until: seance_expiry_time).perform_later(@reservation.id) unless @reservation.status == "paid"
      end

      def seance_expiry_time
        @seance = Seances::UseCases::Show.new.call(id: @reservation.seance_id)
        @seance.date - 30.minutes
      end
    end
  end
end