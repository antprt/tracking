FactoryBot.define do
  factory :pixel do
    name { Faker::Name.unique.name }
    conversions { (1..1500).to_a.sample.to_i }
    association :provider, factory: :provider
  end
end
