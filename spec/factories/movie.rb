FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "Title no: #{n}" }
    age_limit { 7 }
    duration { 120 }
  end
end
