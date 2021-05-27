class Hall < ApplicationRecord
  validates_presence_of :number, :capacity
  has_many :seats
  has_many :seance
end
