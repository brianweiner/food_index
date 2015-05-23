class AddTypeToFoodElement < ActiveRecord::Migration
  def change
    add_column :food_elements, :type, :string
  end
end
