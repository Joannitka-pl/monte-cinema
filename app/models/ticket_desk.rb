class TicketDesk < ApplicationRecord
  has_many :reservations, dependent: :delete_all

  validates_associated :reservations
end
