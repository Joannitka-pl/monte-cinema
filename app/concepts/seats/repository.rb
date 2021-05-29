module Seats
  class Repository < ::BaseRepository

    def initialize(adapter: Seat)
      super(adapter: adapter)
    end
  end
end