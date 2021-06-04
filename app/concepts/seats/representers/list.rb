module Seats
  module Representers
    class List
      attr_reader :available_seats

      def initialize(seats)
        @seats = seats
      end

      def basic
        available_seats.map do |seat|
          Single.new(seat).basic
        end
      end
    end
  end
end
