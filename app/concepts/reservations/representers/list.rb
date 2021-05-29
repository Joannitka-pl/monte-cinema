module Reservations
  module Representers
    class List
      attr_reader :reservations

      def initialize(reservations)
        @reservations = reservations
      end

      def basic
        reservations.map do |reservation|
          Single.new(reservation).basic
        end
      end
    end
  end
end
