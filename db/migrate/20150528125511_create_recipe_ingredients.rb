class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.decimal :amount
      t.string :unit
      t.integer :food_element_id
      t.integer :recipe_id

      t.timestamps null: false
    end
  end
end
