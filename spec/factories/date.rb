FactoryBot.define do
  factory :date do
    date { DateTime.current }
  end
end
