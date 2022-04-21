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

  delegate :create, to: :adapter

  delegate :create!, to: :adapter

  delegate :update, to: :adapter

  delegate :destroy, to: :adapter
end
