class Reservation < ApplicationRecord
  has_many :tickets, dependent: :destroy
  belongs_to :ticket_desk
  belongs_to :client
  belongs_to :seance

  validates :seat, uniqueness: true
  validates :seat, presence: true
  validates_associated :tickets
  validates :status, presence: true, inclusion: {in: %w(paid confirmed canceled), message: "%{status} is not a valid status"}
end
