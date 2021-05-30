class Client < ApplicationRecord
  has_many :reservations

  validates_associated :reservations
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :email, confirmation: { case_sensitive: false }
  validates :email, uniqueness: true
  validates :age, numericality: true
end
