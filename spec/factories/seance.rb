FactoryBot.define do
  factory :seance do
    association :hall
    association :movie
    date { "20/10/2020 10:00" }
  end
end