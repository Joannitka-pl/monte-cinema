module Hall
  module UseCases
    class Update
      attr_reader :repository

      def initialize(repository: Hall::Repository.new)
        @repository = repository
      end

      def call(id, params)
        repository.update(id, params)
      end
    end
  end
end