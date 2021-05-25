require 'rails_helper'

RSpec.describe Hall, type: :model do

  before(:each) do
    @hall = Hall.create(number: 1, capacity: 100)
  end

  describe "validations" do
    context "when all arguments are passed" do
      it 'creates hall with valid number and capacity' do
        expect(@hall).to be_valid
      end
    end

    context "when there is no number in arguments" do
      it 'is invalid without number' do
        @hall.number = nil
        expect(@hall).not_to be_valid
      end
    end

    context "when there is no ccapacity in arguments" do
      it 'is invalid without capacity' do
        @hall.capacity = nil
        expect(@hall).not_to be_valid
      end
    end
  end
end
