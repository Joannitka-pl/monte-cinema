FactoryBot.define do
  factory :client do
    sequence(:name) { |n| "user name no: #{n}" }
    age { 18 }
    email { "fake" }
    real_user { true }
  end
end