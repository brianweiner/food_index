class ChangeIngredientsToFoodElements < ActiveRecord::Migration
  def change
    rename_table :ingredients, :food_elements
  end
end
