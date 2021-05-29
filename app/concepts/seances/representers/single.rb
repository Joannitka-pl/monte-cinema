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
            date: seance.date
          }
      end
    end
  end
end
