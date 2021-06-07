module Seances
  class Repository < ::BaseRepository

    def initialize(adapter: Seance)
      super(adapter: adapter)
    end

    def available_seats(seance)
      seance.hall.generate_seats - reserved_seats(seance)
    end

    def reserved_seats(seance)
      seance.reservations.map(&:seat)
    end
  end
end