class Hall < ActiveRecord::Base
  validates_presence_of :number, :capacity
  has_many :seats
end
