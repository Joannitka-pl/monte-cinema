# frozen_string_literal: true

module Clients
  module UseCases
    class FetchAll
      attr_reader :repository

      def initialize(repository: Clients::Repository.new)
        @repository = repository
      end

      def call
        repository.find_all
      end
    end
  end
end
