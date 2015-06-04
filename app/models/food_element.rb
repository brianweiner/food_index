class FoodElement < ActiveRecord::Base
  validates :name, :presence => true
  validates_uniqueness_of :name
  before_save :downcase_name
  
  has_many(:food_element_connections, :foreign_key => :primary_food_element_id, :dependent => :destroy)
  has_many(:reverse_food_element_connections, :class_name => :FoodElementConnection, 
    :foreign_key => :secondary_food_element_id, :dependent => :destroy)
  has_many :connections, :through => :food_element_connections, :source => :secondary_food_element
  has_many :recipe_ingredients

  scope :ingredients, -> { 
    where( "type ~ '^(" + INGREDIENT_LIST.join("|") + ".*)'")
  }

  scope :main_ingredients, -> {
    where( "type ~ '^(" + MAIN_INGREDIENT_LIST.join("|") + ".*)'")
  }


  def to_partial_path
    '/food_elements/food_element'
  end

  def ingredient?
    raise NotImplementedError
  end

  def primary_ingredient?
    raise NotImplementedError
  end

  private

  def downcase_name
    self.name = self.name.downcase
  end
end
