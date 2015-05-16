class AdjustIngredientConnections < ActiveRecord::Migration
  def change
    change_table :ingredient_connections do |t|
      t.rename :primary_ingredient_id, :primary_food_element_id
      t.rename :secondary_ingredient_id, :secondary_food_element_id
    end
  end
end
