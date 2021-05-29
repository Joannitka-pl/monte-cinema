module Seats
  module Representers
    class List
      attr_reader :seats

      def initialize(seats)
        @seats = seats
      end

      def basic
        seats.map do |seat|
          Single.new(seat).basic
        end
      end
    end
  end
end
