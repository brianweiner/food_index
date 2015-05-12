class IngredientConnection < ActiveRecord::Base
  belongs_to :primary_ingredient, :class_name => :Ingredient
  belongs_to :secondary_ingredient, :class_name => :Ingredient

end
