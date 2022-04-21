# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :reservation
  validates :key, presence: true
end
