
json.recipe do
  json.id @recipe.id
  json.name @recipe.name
  json.description @recipe.description
  json.recipe_ingredients do
    json.partial! 'api/v1/recipe_ingredients/recipe_ingredient', collection: @recipe.recipe_ingredients, as: :recipe_ingredient
  end
end
