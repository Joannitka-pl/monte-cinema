module Seats
  module Representers
    class Single
      attr_reader :seat

      def initialize(seat)
        @seat = seat
      end

      def basic
          {
            id: seat.id,
            row: seat.row,
            number: seat.number,
            availability: seat.availability
          }
      end
    end
  end
end
