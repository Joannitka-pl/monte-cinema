module Hall
  class Repository
    attr_reader :adapter

    def initialize(adapter: Hall)
      @adapter = adapter
    end

    def fetch_all
      adapter.order(:id).all
    end

    def show
      adapter.show(id)
    end

    def create(params)
      adapter.create(params)
    end

    def update(id, params)
      adapter.update(id, params)
    end

    def destroy
      adapter.destroy(id)
    end
  end
end