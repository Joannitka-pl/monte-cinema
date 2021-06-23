FactoryBot.define do
  factory :reservation do
    association :client
    association :seance
    association :ticket_desk
    status { "confirmed" }
    sequence(:seat) { |n| "G #{n}" }
    
    trait :canceled do
      status { "canceled" }
    end
  end
end