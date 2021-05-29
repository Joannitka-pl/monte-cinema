module Seances
  module UseCases
    class Create
      attr_reader :repository

      def initialize(repository: Seances::Repository.new)
        @repository = repository
      end

      def call(params:)
        repository.create(params)
      end
    end
  end
end