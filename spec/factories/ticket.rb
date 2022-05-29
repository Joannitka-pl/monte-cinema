# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    sort { 'regular' }
    price { 20 }
    sequence(:seat) { |n| "G #{n}" }
  end
end
