module Api
  module V1
    class FoodElementsController < ApplicationController
      include ApiAuthentication
      respond_to :json
      autocomplete :food_element, :name, :full => true, :extra_data => [:type], :scopes => [:ingredients] 

      def main_ingredients
        @main_ingredients = FoodElement.main_ingredients
      end
    end
  end
end