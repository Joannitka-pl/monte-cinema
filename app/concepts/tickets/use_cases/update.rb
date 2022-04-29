# frozen_string_literal: true

module Tickets
  module UseCases
    class Update
      attr_reader :repository

      def initialize(repository: Tickets::Repository.new)
        @repository = repository
      end

      def call(id:, params:)
        repository.update(id, params)
      end

      def mark_as_used(id:)
        repository.update(id, used: true)
      end
    end
  end
end
