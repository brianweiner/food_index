class CreateIngredientConnections < ActiveRecord::Migration
  def change
    create_table :ingredient_connections do |t|
      t.integer "primary_ingredient_id", :null => false
      t.integer "secondary_ingredient_id", :null => false
      t.string  "connection_type"
      t.timestamps null: false

    end
  end
end
