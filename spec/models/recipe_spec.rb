require 'rails_helper'

RSpec.describe Recipe do 
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should have_many(:recipe_ingredients) }
  it { should have_many(:recipe_steps) }
  it { should belong_to(:user) }

end