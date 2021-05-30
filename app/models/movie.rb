class Movie < ApplicationRecord
  has_many :seances

  validates :title, uniqueness: { message: "The movie with this title already exists." }

end
