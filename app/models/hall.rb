class Hall < ApplicationRecord
  has_many :seats, dependent: :delete_all
  has_many :seances, dependent: :delete_all

  # validates_associated :seats, :seances

  validates_presence_of :number, :capacity
  validates :capacity, numericality: { only_integer: true }
  validates :number, numericality: { only_integer: true }
  validates :number, uniqueness: { message: "The hall with this number already exists. Please change the number." }

end
