FactoryGirl.define do

  factory :food_element do
    name { Faker::Name.name }

    factory :cuisine_element, parent: :food_element, class: 'Cuisine' do
    end
    factory :ingredient_element, parent: :food_element, class: 'Beef' do
    end
  end

end