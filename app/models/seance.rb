class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  has_many :reservations, dependent: :delete_all

  validates :movie_id, presence: true
  validates :hall_id, presence: true
  validates_associated :reservations
end
