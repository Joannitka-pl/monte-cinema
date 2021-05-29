module Seances
  module UseCases
    class Destroy
      attr_accessor :repository

      def initialize(repository: Seances::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.destroy(id)
      end
    end
  end
end