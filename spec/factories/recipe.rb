FactoryGirl.define do
  factory :recipe do
    name Faker::Name.name
    description Faker::Lorem.words(3)
  end
end