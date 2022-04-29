# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :reservation
  validates :key, presence: true
  # presence validation failes due to false.blank? => true
  validates :used, inclusion: { in: [true, false] }
end
