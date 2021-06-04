class Seat < ApplicationRecord

  validates :number, numericality: { only_integer: true }
  validates :row, format: { with: /\A[a-zA-Z]+\z/, message: 'Only letters allowed' }
end
