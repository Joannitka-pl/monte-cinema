module Halls
  class Repository < ::BaseRepository
    def initialize(adapter: Hall)
      super(adapter: adapter)
    end
  end
end
