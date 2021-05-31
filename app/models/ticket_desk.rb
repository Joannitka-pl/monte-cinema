class TicketDesk < ApplicationRecord
  has_many :reservations

  validates :category, inclusion: { in: %w[online offline]}
end
