module Seances
  module Representers
    class Single
      attr_reader :seance, :seats

      def initialize(seance, seats: {})
        @seance = seance
        @seats = seats
      end

      def basic
          {
            id: seance.id,
            date: seance.date,
            movie_id: seance.movie_id,
            hall_id: seance.hall_id
          }
      end

      def extended
          basic.merge(seats)
      end

    end
  end
end
