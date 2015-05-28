require 'rails_helper'

describe Api::V1::SessionsController do

  before (:each) do
    @user = create(:user, :password => "password")
    @token = @user.authentication_token
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "POST 'sign in'" do
    it "signs in with json" do
      params = {:format => :json, :user => { :email => @user.email, :password => "password" }}
      post :create,  params
      parsed_response = JSON.parse(response.body)

      expect(parsed_response['user']['authentication_token']).to eq(@user.authentication_token)
      expect(response.status).to eq(200)
    end

    it "requires a password" do
      params = {:format => :json, :user => { :email => @user.email, :password => ""}}
      post :create, params
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(401)
      expect(parsed_response['error']).to_not be_empty
    end
  end

  describe "POST 'sign out'" do
    it "refuses requests without a token" do
      request.env['HTTP_AUTHORIZATION'] = ""
      params = {:format => :json, :user => {:email => @user.email}}
      delete :destroy, params

      expect(response.status).to eq(401)
    end

    it "signs out with json" do
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(@token)
      params = {:format => :json, :user => {:email => @user.email}}
      delete :destroy, params

      expect(response.status).to eq(204)

      @token_after_sign_out = User.find(@user.id).authentication_token
      expect(@token_after_sign_out).to_not be(@user.authentication_token)
    end
  end
end