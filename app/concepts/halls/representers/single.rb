# frozen_string_literal: true

module Halls
  module Representers
    class Single
      attr_reader :hall

      def initialize(hall)
        @hall = hall
      end

      def basic
        {
          id: hall.id,
          number: hall.number,
          capacity: hall.capacity
        }
      end
    end
  end
end
