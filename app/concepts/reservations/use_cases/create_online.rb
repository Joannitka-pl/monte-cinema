module Reservations
  module UseCases
    class CreateOnline < Reservations::UseCases::CreateReservationWithTickets
      
      def call(params:)
        super
        cancel_expired_reservation
        send_confirmation_email
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

      def send_confirmation_email(params:)
        client = Clients::Repository.new.show(@reservation.client_id)

        ClientMailer.with(client).reservation_confirmation_email(reservation: @reservation).deliver_now!
      end
    end
  end
end