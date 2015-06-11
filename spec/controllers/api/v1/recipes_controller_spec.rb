require 'rails_helper'

describe Api::V1::RecipesController do
  render_views

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user, password: "password")
    @recipe_one = create(:recipe)
    @recipe_two = create(:recipe)
    @token = @user.authentication_token
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(@token, email: @user.email)
  end

  describe 'GET#index' do
    it 'returns the recipes' do
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['recipes'].count).to eq(2)
    end
  end

  describe 'GET#show' do
    it 'returns the recipe' do
      get :show, id: @recipe_one.id, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['recipe']['id']).to eq(@recipe_one.id)
      expect(parsed_response['recipe']['id']).to_not eq(@recipe_two.id)
    end
  end

  describe 'POST#create' do
    it 'creates a recipe' do
      recipe = FactoryGirl.attributes_for(:recipe).merge(user_id: @user.id)
      params = {format: :json, recipe: recipe }
      post :create, params
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['recipe']).to_not include 'errors'
    end
  end

  describe 'PATCH#update' do
    it 'updates the record' do
      recipe = {name: "new name"}
      params = {format: :json, recipe: recipe, id: @recipe_one.id}
      patch :update, params
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['recipe']).to_not include 'errors'
    end
  end

  describe 'POST#add_recipe_ingredient' do
    it "adds the recipe_ingredient successfully" do
      @food_element = create(:food_element)
      ingredient = FactoryGirl.attributes_for(:recipe_ingredient).merge(foodElementId: @food_element.id)
      params = {format: :json, id: @recipe_one.id, recipeIngredient: ingredient }
      post :add_recipe_ingredient, params
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to_not include 'errors'
    end
  end

  describe 'POST#add_recipe_step' do
    it "adds the recipe_step successfully" do
      step = FactoryGirl.attributes_for(:recipe_step)
      params = {format: :json, id: @recipe_one.id, recipeStep: step }
      post :add_recipe_step, params
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to_not include 'errors'
    end
  end

  describe 'DELETE#recipe' do
    it "deletes the recipe" do
      params = {format: :json, id: @recipe_one.id}
      delete :destroy, params
      expect(response.status).to eq(200)
    end
  end
end