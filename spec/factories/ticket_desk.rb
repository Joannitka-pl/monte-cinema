# frozen_string_literal: true

FactoryBot.define do
  factory :ticket_desk do
    category { 'offline' }
    number { 10 }
  end
end
