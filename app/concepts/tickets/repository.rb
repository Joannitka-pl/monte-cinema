module Tickets
  class Repository < ::BaseRepository
    def initialize(adapter: Ticket)
      super(adapter: adapter)
    end
  end
end
