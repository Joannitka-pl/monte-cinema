class Client < ApplicationRecord
  has_many :reservations, dependent: :delete_all

  validates_associated :reservations
  validates :email, confirmation: { case_sensitive: false }
  validates :email, uniqueness: true
  validates :age, numericality: true
end
