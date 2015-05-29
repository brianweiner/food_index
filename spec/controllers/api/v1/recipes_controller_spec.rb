require 'rails_helper'

describe Api::V1::RecipesController do
  render_views

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user, password: "password")
    @recipe_one = create(:recipe)
    @recipe_two = create(:recipe)
    @token = @user.authentication_token
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(@token)
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

  describe 'POST#add_recipe_ingredient' do
  end

  describe 'POST#add_recipe_step' do
  end

end