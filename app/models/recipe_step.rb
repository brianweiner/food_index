class RecipeStep < ActiveRecord::Base
  acts_as_list scope: :recipe
  belongs_to :recipe

  validates_presence_of :description, :position

end