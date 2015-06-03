module NonIngredientBehaviors
  extend ActiveSupport::Concern

  def ingredient?
    false
  end
end