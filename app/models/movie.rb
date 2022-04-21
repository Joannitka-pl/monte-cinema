class Movie < ApplicationRecord
  has_many :seances, dependent: :destroy

  validates :title, uniqueness: { message: 'The movie with this title already exists.' }
end
