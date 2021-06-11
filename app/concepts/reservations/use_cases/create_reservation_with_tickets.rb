module Reservations
  module UseCases
    class CreateReservationWithTickets
      attr_reader :repository

      def initialize(repository: Reservations::Repository.new)
        @repository = repository
      end

      def call(params:)
        Reservation.transaction do
          reservation_params = params.except(:sort, :price)
          ticket_params = params.except(:status, :client_id, :ticket_desk_id, :seance_id, :seat)
          @reservation = @repository.create!(reservation_params)
          Tickets::UseCases::Create.new(reservation: @reservation, ticket_params: ticket_params).call

          CancelReservationJob.set(wait_until: seance_expiry_time).perform_later(@reservation.id)
        end
      end

      private

      def seance_expiry_time
        @seance = Seances::UseCases::Show.new.call(id: @reservation.seance_id)
        @seance.date - 30.minutes
      end
    end
  end
end
