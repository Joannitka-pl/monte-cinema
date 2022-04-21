module Clients
  class Repository < ::BaseRepository
    def initialize(adapter: Client)
      super(adapter: adapter)
    end
  end
end
