FactoryGirl.define do
  factory :recipe_ingredient do
    food_element
    recipe
    amount 50
    unit 'grams'
  end
end