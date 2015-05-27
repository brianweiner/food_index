class FoodElementConnectionsController < ApplicationController
  before_action :find_or_create_secondary_element, only: [:create]
  before_action :load_connection, only: [:edit,:update, :destroy]
  
  def create
    @connection = FoodElementConnection.create!(food_element_connection_params) 
    respond_to do |format|
      format.html { redirect_to edit_food_element_path(@connection.primary_food_element) }
      format.js   
    end
  end

  def edit
    render :edit, layout: false
  end

  def update
    @connection.update_attributes(connection_update_params)

    respond_to do|format|
      format.html { redirect_to edit_food_element_path(@connection.primary_food_element)}
      format.js
    end
  end

  def destroy
    @connection.destroy!
  end

  private

  def load_connection
    @connection = FoodElementConnection.includes(:secondary_food_element, :primary_food_element).find(params[:id])
  end

  def find_or_create_secondary_element 
    @secondary_element = FoodElement.find_or_initialize_by(name: params[:food_element][:new_element_name])
    if @secondary_element.new_record?
      @secondary_element.type = params[:food_element][:new_type]
      @secondary_element.save!
    end
  end

  def food_element_connection_params
    params.require(:food_element_connection).permit(:primary_food_element_id,:secondary_food_element_id,:connection_type).merge(secondary_food_element_id: @secondary_element.id)
  end

  def connection_update_params
    params.require(:food_element_connection).permit(:connection_type)
  end
end