class Reservation < ApplicationRecord
  has_many :tickets
  belongs_to :ticket_desk
  belongs_to :client
  belongs_to :seance
end
