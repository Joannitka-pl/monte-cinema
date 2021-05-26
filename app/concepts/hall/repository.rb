module Hall
  class Repository
    attr_reader :adapter

    def initialize(adapter: Hall::Model)
      @adapter = adapter
    end

    def fetch_all
      adapter.all
    end
  end
end