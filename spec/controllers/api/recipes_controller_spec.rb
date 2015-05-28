require 'rails_helper'

describe Api::V1::RecipesController do
  render_views

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user, password: "password")
    @token = @user.authentication_token
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(@token)
  end

  describe 'GET#index' do
    before do
      @recipe = create(:recipe, name: 'A new recipe')
    end

    it 'returns the recipes' do
      get :index
      parsed_response = JSON.parse(response.body)

      expect(parsed_response['recipes']).to_not be_empty
    end
  end
end