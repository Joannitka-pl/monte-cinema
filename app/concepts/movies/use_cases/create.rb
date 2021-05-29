module Movies
  module UseCases
    class Create
      attr_reader :repository

      def initialize(repository: Movies::Repository.new)
        @repository = repository
      end

      def call(params:)
        repository.create(params)
      end
    end
  end
end