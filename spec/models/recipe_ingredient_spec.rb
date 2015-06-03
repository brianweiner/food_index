require 'rails_helper'

RSpec.describe RecipeIngredient do
  it { should validate_presence_of :amount }
  it { should validate_presence_of :unit }
  it { should validate_presence_of :food_element_id }
  it { should belong_to :food_element }
  it { should belong_to :recipe }
end