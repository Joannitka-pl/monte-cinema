# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  has_many :reservations, dependent: :destroy

  enum role: {
    user: 'user',
    ticket_checker: 'ticket_checker',
    employee: 'employee',
    admin: 'admin'
  }, _prefix: :role

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
