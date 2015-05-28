class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps do |t|
      t.text :description
      t.integer :position
      t.integer :recipe_id

      t.timestamps null: false
    end
  end
end
