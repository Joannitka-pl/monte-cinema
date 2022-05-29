# frozen_string_literal: true

module Movies
  module Representers
    class Single
      attr_reader :movie

      def initialize(movie)
        @movie = movie
      end

      def basic
        {
          id: movie.id,
          title: movie.title,
          age_limit: movie.age_limit,
          duration: movie.duration
        }
      end
    end
  end
end
