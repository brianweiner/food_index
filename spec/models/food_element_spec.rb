require 'rails_helper'

RSpec.describe FoodElement, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :recipe_ingredients }

  context "callback functions" do
    it "#before_save downcase name" do
      @food_element = create(:food_element, name: 'Potato')
      expect(@food_element.name).to eq('potato')
    end
  end
end
