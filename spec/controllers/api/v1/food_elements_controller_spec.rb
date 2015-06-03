require 'rails_helper'

describe Api::V1::FoodElementsController do 
  render_views

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user, password: "password")
    @main_ingredient = create(:ingredient_element, type: 'Beef')
    @other_main = create(:ingredient_element)
    @cuisine_element = create(:cuisine_element, type: 'Cuisine')
    @token = @user.authentication_token
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(@token)
  end
  
  describe 'GET#main_ingredients' do
    it "returns ingredients with types in the MAIN_INGREDIENT_LIST" do
      get :main_ingredients, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['food_elements'].count).to be(2)
    end
  end
end