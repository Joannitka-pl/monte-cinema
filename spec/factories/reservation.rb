FactoryBot.define do
  factory :reservation do
    association :client
    association :seance
    association :ticket_desk
    status { "confirmed" }
    seat {"G9"}

    trait :canceled do
      status { "canceled" }
    end
  end
end