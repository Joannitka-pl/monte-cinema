module Seances
  module Representers
    class List
      attr_reader :seances

      def initialize(seances)
        @seances = seances
      end

      def basic
        seances.map do |seance|
          {
            id: seance.id,
            date: seance.date
          }
        end
      end
    end
  end
end
