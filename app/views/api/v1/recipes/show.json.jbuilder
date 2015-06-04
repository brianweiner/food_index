
json.recipe do
  json.id @recipe.id
  json.name @recipe.name
  json.description @recipe.description
  json.recipeIngredients do
    json.partial! 'api/v1/recipe_ingredients/recipe_ingredient', collection: @recipe.recipe_ingredients, as: :recipe_ingredient
  end
  json.recipeSteps do
    json.partial! 'api/v1/recipe_steps/recipe_step', collection: @recipe.recipe_steps, as: :recipe_step
  end
end
