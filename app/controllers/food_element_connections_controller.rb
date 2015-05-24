class FoodElementConnectionsController < ApplicationController
  before_action :find_or_create_secondary_element, only: [:create]

  def create
    @connection = FoodElementConnection.create!(food_element_connection_params) 
    unless @connection
      #return some error
    end
  end

  private

  def find_or_create_secondary_element 
    @secondary_element = FoodElement.find_or_initialize_by(name: params[:food_element][:name])
    if @secondary_element.new_record?
      @secondary_element.type = params[:food_element][:type]
      @secondary_element.save!
    end
  end

  def food_element_connection_params
    params.require(:food_element_connection).permit(:primary_food_element_id,:secondary_food_element_id,:connection_type).merge(secondary_food_element_id: @secondary_element.id)
  end
end