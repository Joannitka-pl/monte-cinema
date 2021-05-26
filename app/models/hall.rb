class Model < ActiveRecord::Base
  validates_presence_of :number, :capacity
end
