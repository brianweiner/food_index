module Api
  module V1
    class RecipesController < ApplicationController
      include ApiAuthentication
      respond_to :json

      def index
        @recipes = Recipe.all
      end

      def show
        @recipe = Recipe.find(params[:id])
      end

      def create
        @recipe = Recipe.create(recipe_params)
        unless @recipe
          render json: { errors: recipe.errors }, status: 422
        end
      end

      private

      def recipe_params
        params.require(:recipe).permit(:name,:description)
      end
    end
  end
end

