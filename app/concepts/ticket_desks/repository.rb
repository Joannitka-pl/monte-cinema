module TicketDesks
  class Repository < ::BaseRepository
    def initialize(adapter: TicketDesk)
      super(adapter: adapter)
    end
  end
end
