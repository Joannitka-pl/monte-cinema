module Seances
  module UseCases
    class Show
      attr_reader :repository
      
      def initialize(repository: Seances::Repository.new)
        @repository = repository
      end
      
      def call(id:)
        repository.show(id)
      end
    end
  end
end