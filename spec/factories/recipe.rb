FactoryGirl.define do
  factory :recipe do
    name { Faker::Name.name }
    description "a description"
    association :user
  end

end