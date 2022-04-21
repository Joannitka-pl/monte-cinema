module Halls
  module UseCases
    class Update
      attr_reader :repository

      def initialize(repository: Halls::Repository.new)
        @repository = repository
      end

      def call(id:, params:)
        repository.update(id, params)
      end
    end
  end
end
