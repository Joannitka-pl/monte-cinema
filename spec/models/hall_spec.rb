require 'rails_helper'

RSpec.describe Hall, type: :model do

  before(:each) do
    @hall = Hall.create(number: 1, capacity: 100)
  end

  it 'creates hall with valid number and capacity' do
    expect(@hall).to be_valid
  end

  it 'is invalid without number' do
    @hall.number = nil
    expect(@hall).not_to be_valid
  end

  it 'is invalid without capacity' do
    @hall.capacity = nil
    expect(@hall).not_to be_valid
  end

end
