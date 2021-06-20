class BaseRepository
  attr_reader :adapter

  def initialize(adapter:)
    @adapter = adapter
  end

  def find_all
    adapter.order(:id).all
  end

  def show(id)
    adapter.find(id)
  end

  def create(params)
    adapter.create(params)
  end

  def create!(params)
    adapter.create!(params)
  end

  def update(id, params)
    adapter.update(id, params)
  end

  def destroy(id)
    adapter.destroy(id)
  end
end
