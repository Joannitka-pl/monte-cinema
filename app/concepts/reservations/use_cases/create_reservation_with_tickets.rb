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
          # reservation_params = (params[:seat]).split(',')
          ticket_params = params.except(:status, :client_id, :ticket_desk_id, :seance_id, :seat)
          @reservation = @repository.create!(reservation_params)
          Tickets::UseCases::Create.new(reservation: @reservation, ticket_params: ticket_params).call
        end
      end
    end
  end
end
