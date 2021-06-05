module Seances
  module Representers
    class List
      attr_reader :seances, :movie

      def initialize(seances)
        @seances = seances
      end

      def basic
        seances.map do |seance|
          Single.new(seance).basic
        end
      end

      def extended
        seances.map do |seance|
          Single.new(seance).extended
        end
      end
    end
  end
end