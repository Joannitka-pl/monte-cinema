module Hall
  module UseCases
    class Destroy
      attr_accessor :repository

      def initialize(repository: Hall::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.destroy
      end
    end
  end
end