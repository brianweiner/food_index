class FoodElement < ActiveRecord::Base
  validates :name, :presence => true
  validates_uniqueness_of :name

  has_many(:food_element_connections, :foreign_key => :primary_food_element_id, :dependent => :destroy)
  has_many(:reverse_food_element_connections, :class_name => :FoodElementConnection, 
    :foreign_key => :secondary_food_element_id, :dependent => :destroy)
  has_many :connections, :through => :food_element_connections, :source => :secondary_food_element

  before_save :downcase_name

  def to_partial_path
    '/food_elements/food_element'
  end

  def connection_strength_to primary_food_element
    FoodElementConnection.where(primary_food_element_id: primary_food_element, secondary_food_element_id: self.id).first
  end

  private

  def downcase_name
    self.name = self.name.downcase
  end
end
