class RenameIngredientConnections < ActiveRecord::Migration
  def change
    rename_table :ingredient_connections, :food_element_connections
  end
end
