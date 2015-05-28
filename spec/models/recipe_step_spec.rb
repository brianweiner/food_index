require 'rails_helper'

RSpec.describe RecipeStep do
  it { should validate_presence_of :description }
  it { should belong_to :recipe }
end