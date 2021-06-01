module Reservations
  module UseCases
    class Create
      attr_reader :repository

      def initialize(repository: Reservations::Repository.new)
        @repository = repository
      end

      def call(params:)
        reservation = repository.create(params)
        ticket_desk = TicketDesks::UseCases::Show.new.call(id: params[:ticket_desk_id])

          if ticket_desk.category == offline
            ReservationTimeoutJob.set(wait: 10.minutes).perform_later(reservation.id)
          end
      end
    end
  end
end