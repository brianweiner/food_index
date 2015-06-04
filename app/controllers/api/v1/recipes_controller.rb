module Api
  module V1
    class RecipesController < ApplicationController
      include ApiAuthentication
      respond_to :json
      before_action :load_recipe, only: [:show, :update, :add_recipe_ingredient, :add_recipe_step, :destroy]

      def index
        @recipes = Recipe.all
        if @recipes.count == 0
          render json: { recipes: [] }, status: 200
        end
      end

      def show
      end

      def create
        @recipe = Recipe.create(recipe_params)
        unless @recipe.errors.blank?
          render json: { recipe: {errors: @recipe.errors }}, status: 422
        end
      end

      def update
        unless @recipe.update_attributes(recipe_params)
          render json: { recipe: { errors: @recipe.errors }}, status: 422
        end
      end

      def add_recipe_ingredient
        @recipe_ingredient = @recipe.recipe_ingredients.create(recipe_ingredient_params)
        unless @recipe_ingredient.errors.blank?
          render json: { recipe_ingredient: { errors: @recipe_ingredient.errors }}, status: 422
        end
      end

      def add_recipe_step
        @recipe_step = @recipe.recipe_steps.create(recipe_step_params)
        unless @recipe_step.errors.blank?
          render json: { recipe_step: { errors: @recipe_step.errors }}, status: 422
        end
      end

      def destroy
        @recipe.destroy
        render json: { message: 'Deleted' }, status: 200
      end

      private

      def load_recipe
        @recipe = Recipe.includes(:recipe_steps,recipe_ingredients: [:food_element]).find(params[:id])
      end

      def recipe_params
        params.require(:recipe).permit(:name,:description,:user_id)
      end

      def recipe_ingredient_params
        params.require(:recipeIngredient).permit(:amount, :unit, :food_element_id)
      end

      def recipe_step_params
        params.require(:recipeStep).permit(:description)
      end
    end
  end
end

