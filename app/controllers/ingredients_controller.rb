class IngredientsController < ApplicationController
  autocomplete :ingredient, :name, :full => true

  def index
    @ingredients = Ingredient.order(:name)
  end
  
  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @connections = params[:connection_names].split(',')
    if @ingredient = Ingredient.create!(ingredient_params)
      @connections.each do |connection|
        @split = connection.split(":")
        @new_ingredient = Ingredient.find_or_create_by(name: @split.first)
        IngredientConnection.create!(
          primary_ingredient_id: @ingredient.id,
          secondary_ingredient_id: @new_ingredient.id,
          connection_type: @split.last.downcase
          )
      end

      redirect_to(@ingredient, :notice => 'Ingredient was successfully updated.')
    else
      flash[:alert] = "There was a problem"
      render :edit
    end
  end

  def update
    @connections = params[:connection_names].split(',')
    @ingredient = Ingredient.find(params[:id])
    if @ingredient
      @connections.each do |connection|
        @split = connection.split(":")
        @new_ingredient = Ingredient.find_or_create_by(name: @split.first.downcase)
        IngredientConnection.create!(
          primary_ingredient_id: @ingredient.id,
          secondary_ingredient_id: @new_ingredient.id,
          connection_type: @split.last.downcase
          )
      end

      redirect_to(@ingredient, :notice => 'Ingredient was successfully created.')
    else
      flash[:alert] = "There was a problem"
      render :new
    end
  end
  def show
    @ingredient = Ingredient.find(params[:id])
    @connections = @ingredient.ingredient_connections
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
