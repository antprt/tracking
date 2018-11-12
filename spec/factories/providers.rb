FactoryBot.define do
  factory :provider do
    name { Faker::Name.unique.name }
  end
end
