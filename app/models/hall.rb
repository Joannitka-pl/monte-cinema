# frozen_string_literal: true

class Hall < ApplicationRecord
  has_many :seances, dependent: :destroy

  validates :number, :capacity, presence: true
  validates :capacity, numericality: { only_integer: true }
  validates :number, numericality: { only_integer: true }
  validates :number, uniqueness: { message: 'The hall with this number already exists. Please change the number.' }

  def generate_seats
    available_seats = ('A'..(65 + capacity / 10).chr).map do |row|
      (1..10).map do |seat|
        "#{row}#{seat}"
      end
    end
    available_seats.flatten
  end
end
