# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    association :client
    association :user
    association :seance
    association :ticket_desk
    status { 'confirmed' }
    trait :canceled do
      status { 'canceled' }
    end
  end
end
