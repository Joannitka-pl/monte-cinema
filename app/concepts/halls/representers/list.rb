# frozen_string_literal: true

module Halls
  module Representers
    class List
      attr_reader :halls

      def initialize(halls)
        @halls = halls
      end

      def basic
        halls.map do |hall|
          Single.new(hall).basic
        end
      end
    end
  end
end
