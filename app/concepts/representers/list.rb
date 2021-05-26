module Hall
  module Representers
    class List
      attr_reader :halls

      def initialize(halls)
        @halls = halls
      end

      def basic
        halls.map do |hall|
          {
            id: hall.id,
            capacity: hall.capacity
          }
        end
      end
    end
  end
end
