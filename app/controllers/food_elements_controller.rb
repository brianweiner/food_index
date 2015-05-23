class FoodElementsController < ApplicationController
  autocomplete :food_element, :name, :full => true
  before_action :assign_food_element, only: [:show, :edit, :update]

  def index
    @food_elements = FoodElement.order(:name)
  end
  
  def show
    @connections = @food_element.food_element_connections
  end

  def new
    @food_element = FoodElement.new
  end

  def edit
  end

  def add_connection
    @food_element = FoodElement.find(params[:id])
  end

  def create
    if @food_element = FoodElement.create!(food_element_params)
      redirect_to edit_food_element_path(@food_element), :notice => 'Element was successfully created.'
    else
      flash[:alert] = "There was a problem"
      render :new
    end
  end

  def update
    if @food_element.update_attributes(food_element_params)
      redirect_to food_element_path(@food_element), :notice => 'Element was successfully updated.'
    else
      flash[:alert] = "There was a problem"
      render :edit
    end
  end


  private

  def assign_food_element
    @food_element = FoodElement.find(params[:id])
  end

  def food_element_params
    params.require(:food_element).permit(:name, :type)
  end
end
