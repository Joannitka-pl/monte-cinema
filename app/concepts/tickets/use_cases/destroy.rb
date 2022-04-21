# frozen_string_literal: true

module Tickets
  module UseCases
    class Destroy
      attr_accessor :repository

      def initialize(repository: Tickets::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.destroy(id)
      end
    end
  end
end
