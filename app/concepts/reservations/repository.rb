module Reservations
  class Repository < ::BaseRepository
    def initialize(adapter: Reservation)
      super(adapter: adapter)
    end
  end
end
