class FoodElementConnection < ActiveRecord::Base
  belongs_to :primary_food_element, :class_name => :FoodElement
  belongs_to :secondary_food_element, :class_name => :FoodElement

  before_save :downcase_connection_type

  private

  def downcase_connection_type
    self.connection_type = self.connection_type.downcase
  end

end
