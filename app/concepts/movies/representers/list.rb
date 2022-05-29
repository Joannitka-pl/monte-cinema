# frozen_string_literal: true

module Movies
  module Representers
    class List
      attr_reader :movies

      def initialize(movies)
        @movies = movies
      end

      def basic
        movies.map do |movie|
          Single.new(movie).basic
        end
      end
    end
  end
end
