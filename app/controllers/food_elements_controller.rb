class FoodElementsController < ApplicationController
  autocomplete :food_element, :name, :full => true

  def index
    @food_elements = FoodElement.order(:name)
  end
  
  def new
    @food_element = FoodElement.new
  end

  def edit
    @food_element = FoodElement.find(params[:id])
  end

  def create
    @connections = params[:connection_names].split(',')
    if @food_element = FoodElement.create!(food_element_params)
      @connections.each do |connection|
        @split = connection.split(":")
        @new_food_element = FoodElement.find_or_create_by(name: @split.first)
        FoodElementConnection.create!(
          primary_food_element_id: @food_element.id,
          secondary_food_element_id: @new_food_element.id,
          connection_type: @split.last.downcase
          )
      end

      redirect_to(@food_element, :notice => 'Element was successfully updated.')
    else
      flash[:alert] = "There was a problem"
      render :edit
    end
  end

  def update
    @connections = params[:connection_names].split(',')
    @food_element = FoodElement.find(params[:id])
    if @food_element
      @connections.each do |connection|
        @split = connection.split(":")
        @new_food_element = FoodElement.find_or_create_by(name: @split.first.downcase)
        FoodElement.create!(
          primary_food_element_id: @food_element.id,
          secondary_food_element_id: @new_food_element.id,
          connection_type: @split.last.downcase
          )
      end

      redirect_to(@food_element, :notice => 'Element was successfully created.')
    else
      flash[:alert] = "There was a problem"
      render :new
    end
  end
  def show
    @food_element = FoodElement.find(params[:id])
    @connections = @food_element.food_element_connections
  end

  private

  def food_element_params
    params.require(:food_element).permit(:name)
  end
end
