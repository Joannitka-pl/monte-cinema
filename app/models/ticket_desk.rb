class TicketDesk < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates_associated :reservations
end
