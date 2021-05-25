class Hall < ApplicationRecord
  validates_presence_of :number, :capacity
end
