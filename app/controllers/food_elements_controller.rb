class FoodElementsController < ApplicationController
  autocomplete :food_element, :name, :full => true
  before_action :assign_food_element, only: [:show, :edit, :update, :destroy]
  before_action :assign_connections, only: [:show, :edit]

  def index
    @food_elements = FoodElement.paginate(:page => params[:page]).order(:name)
  end
  
  def show
    wiki = WikipediaLoader.new(element_name: @food_element.name)
    @wiki_title = wiki.wiki_title
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
      redirect_to edit_food_element_path(@food_element), :flash => {:success => 'Element was successfully created.'}
    else
      render :new, :alert => "There was a problem"
    end
  end

  def update
    if @food_element.update_attributes(food_element_params)
      redirect_to food_element_path(@food_element), :flash => {:success => 'Element was successfully updated.'}
    else
      render :edit, :alert => "There was a problem"

    end
  end

  def destroy
    if @food_element.destroy!
      redirect_to food_elements_path, :flash => {:success => "Element was deleted"}
    end
  end

  def search
    @search_term = params[:element_name]
    @food_elements = FoodElement.where("name ilike ?", "%#{@search_term}%").paginate(:page => params[:page])
  end

  private

  def assign_food_element
    @food_element = FoodElement.find(params[:id])
  end

  def assign_connections
    @connections = @food_element.food_element_connections.includes(:secondary_food_element).order('food_elements.name ASC') #order needed to use the actual table name
    @reverse_connections = @food_element.reverse_food_element_connections.includes(:primary_food_element).order('food_elements.name DESC')
  end

  def food_element_params
    params.require(:food_element).permit(:name, :type)
  end
end
