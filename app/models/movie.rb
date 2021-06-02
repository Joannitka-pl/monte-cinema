class Movie < ApplicationRecord
  has_many :seances, dependent: :delete_all

  validates :title, uniqueness: { message: "The movie with this title already exists." }

end
