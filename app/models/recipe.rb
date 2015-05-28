class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipe_steps, -> { order(position: :asc) }
  belongs_to :user

  validates_presence_of :name, :description

end