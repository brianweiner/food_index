class FoodElementConnection < ActiveRecord::Base
  belongs_to :primary_food_element, :class_name => :FoodElement
  belongs_to :secondary_food_element, :class_name => :FoodElement

end
