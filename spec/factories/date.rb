# frozen_string_literal: true

FactoryBot.define do
  factory :date do
    date { DateTime.current }
  end
end
