class Reservation < ApplicationRecord
  has_many :tickets
  belongs_to :ticket_desk
  belongs_to :client
  belongs_to :seance

  validates_associated :tickets
  validates :status, presence: true, inclusion: {in: %w(confirmed pending temporary canceled), message: "%{status} is not a valid status"}
end
