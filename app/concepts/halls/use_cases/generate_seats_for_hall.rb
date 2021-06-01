module Halls
  module UseCases
    class GenerateSeatsForHall
      attr_reader :last_row_letter

      def initialize(id)
        @hall = repository.find_by(id)
        capacity = @hall.read_attribute(:capacity)
        @last_row_letter = ('A'..'Z').to_a[capacity/10-1]
      end

      def call
        Seats::UseCases::GenerateSeats.new(@last_row_letter).call
      end

    end
  end
end