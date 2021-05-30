class TicketDesk < ApplicationRecord
  has_many :reservations

  validates_associated :reservations
end
