class Hall < ActiveRecord::Base
  validates_presence_of :number, :capacity
  has_many :seats
  has_many :seance
end
