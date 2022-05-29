# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    sequence(:name) { |n| "user name no: #{n}" }
    age { 18 }
    sequence(:email) { |n| "fakeemail_#{n}@mail.com" }
    real_user { false }
  end
end
