module Reservations
  module UseCases
    class CreateOnline < Reservations::UseCases::CreateReservationWithTickets
      def call(params:)
        super
        @reservation
        send_confirmation_email
      end

      def send_confirmation_email
        client = Clients::Repository.new.show(@reservation.client_id)
        ClientMailer.with(client).reservation_confirmation_email.deliver_later
      end
    end
  end
end
