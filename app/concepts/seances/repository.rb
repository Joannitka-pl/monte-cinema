module Seances
  class Repository < ::BaseRepository

    def initialize(adapter: Seance)
      super(adapter: adapter)
    end

    def seats_available(seance)
      seance.hall.generate_seats
    end

    def seats_not_available(seance)
    end
  end
end