# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "fakeemail_#{n}@mail.com" }
    role { 'user' }
    password { 'password' }
  end
end
