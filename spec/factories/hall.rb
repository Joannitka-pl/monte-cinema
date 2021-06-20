FactoryBot.define do
  factory :hall do
    sequence(:number) { |n| n + 1 }
    capacity { 100 }
  end
end