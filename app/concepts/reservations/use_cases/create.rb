module Reservations
  module UseCases
    class Create
      attr_reader :repository

      def initialize(repository: Reservations::Repository.new)
        @repository = repository
      end

      def call(params:)
        repository.create(params)

      if ticket_desk.category == offline
        ReservationTimeoutJob.set(wait: 10.minutes).perform_later(reservation)
      end

      end
    end
  end
end