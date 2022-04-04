# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :reservation
  validates :reservation_id, presence: true
end
