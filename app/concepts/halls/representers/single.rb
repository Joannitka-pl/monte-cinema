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
            capacity: hall.capacity
          }
      end
    end
  end
end
