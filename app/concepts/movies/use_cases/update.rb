module Movies
  module UseCases
    class Update
      attr_reader :repository

      def initialize(repository: Movies::Repository.new)
        @repository = repository
      end

      def call(id:, params:)
        repository.update(id, params)
      end
    end
  end
end
