module Api
  module V1
    class FoodElementsController < ApplicationController
      include ApiAuthentication
      respond_to :json
      autocomplete :food_element, :name, :full => true, :extra_data => [:type], :scopes => [:ingredients] 

      def main_ingredients
        @main_ingredients = FoodElement.main_ingredients
      end

      def ingredient_connections
        @food_element = FoodElement.find(params[:primary_food_element_id])
        @connections = @food_element.food_element_connections.includes(:secondary_food_element)
      end
    end
  end
end