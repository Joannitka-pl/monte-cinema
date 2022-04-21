# frozen_string_literal: true

module Reservations
  module UseCases
    class Show
      attr_reader :repository

      def initialize(repository: Reservations::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.show(id)
      end
    end
  end
end
