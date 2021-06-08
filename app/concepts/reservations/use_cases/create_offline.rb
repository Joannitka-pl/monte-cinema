module Reservations
  module UseCases
    class CreateOffline
      attr_reader :repository

      def initialize(repository: Reservations::Repository.new)
        @repository = repository
      end

      def call(params:)
        repository.create(params)
      end
    end
  end
end