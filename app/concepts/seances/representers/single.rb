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
            movie_id: seance.movie_id
          }
      end

      def extended
        {
          **basic,
          movies: movie.title
        }
      end

    end
  end
end
