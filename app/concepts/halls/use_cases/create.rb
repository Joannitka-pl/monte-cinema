module Halls
  module UseCases
    class Create
      attr_reader :repository

      def initialize(repository: Halls::Repository.new)
        @repository = repository
      end

      def call
        repository.create(params)
      end
    end
  end
end