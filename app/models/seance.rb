class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  has_many :reservations

  # validates :movie_id, presence: true
  # validates :hall_id, presence: true
end
