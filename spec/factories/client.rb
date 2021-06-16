FactoryBot.define do
  factory :client do
    sequence(:name) { |n| "user name no: #{n}" }
    age { 18 }
    email { "fakeemail@mail.com" }
    real_user { false }
  end
end