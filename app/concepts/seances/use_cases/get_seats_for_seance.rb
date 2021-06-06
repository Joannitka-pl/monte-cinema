module Seances
  module UseCases
    class GetSeatsForSeance
      attr_reader :repository, :seance

      def initialize(seance:, repository: Seances::Repository.new)
        @repository = repository
        @seance = seance
      end

      def call
        { available_seats: repository.seats_available(seance) }
      end
    end
  end
end