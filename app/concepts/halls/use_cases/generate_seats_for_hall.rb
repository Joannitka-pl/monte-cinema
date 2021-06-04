module Halls
  module UseCases
    class GenerateSeatsForHall
      attr_reader :available_seats

      def initialize(capacity)
        @capacity = capacity
      end

      def call
        #don't know why @capacity is a symbol

        last_row_letter = ('A'..'Z').to_a[@capacity.to_s.to_i / 10-1]
        rows = ('A'..last_row_letter.capitalize)
        seats = (1..10)
        available_seats = rows.zip(seats).map {|a| a.join(',')}
        available_seats
      end
    end
  end
end
