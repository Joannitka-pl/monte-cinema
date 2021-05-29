module Seances
  module Representers
    class Single
      attr_reader :seance

      def initialize(seance)
        @seance = seance
      end

      def basic
          {
            id: seance.id,
            date: seance.date,
            time: seance.time,
            movie: seance.movie_id,
            hall: seance.hall_id
          }
      end
    end
  end
end
