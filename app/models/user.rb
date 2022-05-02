# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  has_many :reservations, dependent: :destroy

  enum role: {
    user: 0,
    usher: 1,
    employee: 2,
    admin: 3
  }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
