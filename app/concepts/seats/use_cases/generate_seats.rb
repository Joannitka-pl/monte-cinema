module Seats
  module UseCases
    class GenerateSeats
      attr_reader :last_row_letter

      def initialize(last_row_letter)
        @last_row_letter = last_row_letter
      end

      def call
        rows = ('A'..@last_row_letter)
        seats = (1..10)
        @available_seats = rows.zip(seats).map {|a| a.join(',')}
      end
    end
  end
end