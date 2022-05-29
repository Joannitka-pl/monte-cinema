# frozen_string_literal: true

module Reservations
  module UseCases
    class Update
      attr_reader :repository

      def initialize(repository: Reservations::Repository.new)
        @repository = repository
      end

      def call(id:, params:)
        repository.update(id, params)
      end
    end
  end
end
