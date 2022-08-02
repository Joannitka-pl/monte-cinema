# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    sort { 'regular' }
    price { 20 }
    sequence(:seat) { |n| "G #{n}" }
    used { false }
    key { SecureRandom.base64(32).to_s }
  end
end
