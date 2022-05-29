# frozen_string_literal: true

class TicketDesk < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates_associated :reservations
end
