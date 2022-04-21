# frozen_string_literal: true

module Clients
  module UseCases
    class Destroy
      attr_accessor :repository

      def initialize(repository: Clients::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.destroy(id)
      end
    end
  end
end
