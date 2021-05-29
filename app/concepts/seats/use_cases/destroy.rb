module Seats
  module UseCases
    class Destroy
      attr_accessor :repository

      def initialize(repository: Seats::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.destroy(id)
      end
    end
  end
end