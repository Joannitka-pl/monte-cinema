module Reservations
  module UseCases
    class CreateOnline < Reservations::UseCases::CreateReservationWithTickets
      def call(params:)
        super
        send_confirmation_email
        @reservation
      end

      def send_confirmation_email
        client = Clients::Repository.new.show(@reservation.client_id)
        seance = Seances::Repository.new.show(@reservation.seance_id)
        movie = Movies::Repository.new.show(seance.movie_id)

        ClientMailer.with(client).reservation_confirmation_email(reservation: @reservation).deliver_now!
      end
    end
  end
end
