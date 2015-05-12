class Ingredient < ActiveRecord::Base
  validates :name, :presence => true
  validates_uniqueness_of :name

  has_many(:ingredient_connections, :foreign_key => :primary_ingredient_id, :dependent => :destroy)
  has_many(:reverse_ingredient_connections, :class_name => :IngredientConnection, 
    :foreign_key => :secondary_ingredient_id, :dependent => :destroy)
  has_many :connections, :through => :ingredient_connections, :source => :secondary_ingredient

  def connection_strength_to primary_ingredient
    IngredientConnection.where(primary_ingredient_id: primary_ingredient, secondary_ingredient_id: self.id).first
  end
end
