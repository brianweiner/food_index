json.recipe_ingredient recipe_ingredient, :id, :amount, :unit

json.recipe_ingredient do  
  json.partial! 'api/v1/food_elements/food_element', food_element: recipe_ingredient.food_element
end 
