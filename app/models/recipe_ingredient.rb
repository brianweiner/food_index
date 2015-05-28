class RecipeIngredient < ActiveRecord::Base

  belongs_to :food_element
  belongs_to :recipe

  validates_presence_of :amount, :unit

end