module Movies
  class Repository < ::BaseRepository
    def initialize(adapter: Movie)
      super(adapter: adapter)
    end
  end
end
