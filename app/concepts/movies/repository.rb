# frozen_string_literal: true

module Movies
  class Repository < ::BaseRepository
    def initialize(adapter: Movie)
      super(adapter: adapter)
    end
  end
end
