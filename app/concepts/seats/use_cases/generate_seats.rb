module Seats
  module UseCases
    class GenerateSeats

      def initialize(capacity)
        @capacity = capacity
      end

      def call
        rows = ('A'..@last_row_letter.capitalize)
        seats = (1..10)
        available_seats = rows.map { |x|  }.map {|a| a.join(',')}
         available_seats
      end
    end
  end
end