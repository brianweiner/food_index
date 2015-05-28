module Api
  module V1
    class RecipesController < ApplicationController
      include ApiAuthentication
      respond_to :json

      def index
        @recipes = Recipe.all
        render json: { recipes: @recipes }
      end

    end
  end
end

