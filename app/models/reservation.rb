# frozen_string_literal: true

class Reservation < ApplicationRecord
  has_many :tickets, dependent: :destroy
  belongs_to :ticket_desk
  belongs_to :client
  belongs_to :seance
  belongs_to :user, optional: true

  validates_associated :tickets
  validates :status, presence: true,
                     inclusion: { in: %w[paid confirmed canceled], message: '%{status} is not a valid status' }
end
