module Reservations
  module UseCases
    class FetchAll
      attr_reader :repository

      def initialize(repository: Reservations::Repository.new)
        @repository = repository
      end

      def call
        repository.find_all
      end
    end
  end
end