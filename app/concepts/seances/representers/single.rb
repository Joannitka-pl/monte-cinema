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
            movie_id: seance.movie_id,
            hall_id: seance.hall_id
          }
      end

      # def extended
      #   {
      #     **basic,
      #     movies: movie
      #   }
      # end
      
      # private 

      # def movie
      #   @movie = Movies::Representers::All.new(movie.title).basic
      # end

    end
  end
end
