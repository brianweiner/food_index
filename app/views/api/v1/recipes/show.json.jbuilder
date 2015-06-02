json.partial! 'api/v1/recipes/recipe', recipe: @recipe
json.recipe_ingredients @recipe.recipe_ingredients do |recipe_ingredient|
  json.id recipe_ingredient.id
  json.name recipe_ingredient.food_element.name
  json.type recipe_ingredient.food_element.type
  json.amount recipe_ingredient.amount
  json.unit recipe_ingredient.unit
end