module Hall
  module UseCases
    class FetchAll
      attr_reader :repository

      def initialize(repository: Hall::Repository.new)
        @repository = repository
      end

      def call
        repository.fetch_all
      end
    end
  end
end