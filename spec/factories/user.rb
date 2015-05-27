FactoryGirl.define do
  sequence :email do |n|
    "testing#{n}times@example.com"
  end

  factory :user do
    email
    password "password"
  end
end