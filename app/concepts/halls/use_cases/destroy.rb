module Halls
  module UseCases
    class Destroy
      attr_accessor :repository

      def initialize(repository: Halls::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.destroy
      end
    end
  end
end