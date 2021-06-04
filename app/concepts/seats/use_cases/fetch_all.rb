module Seats
  module UseCases
    class FetchAll
      attr_reader :repository
      attr_reader :available_seats


      def initialize(repository: Seats::Repository.new)
        @repository = repository
      end

      def call
        repository.find_all
        available_seats
      end
    end
  end
end