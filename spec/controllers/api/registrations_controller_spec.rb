require 'rails_helper'

describe Api::V1::RegistrationsController do
  render_views

  before (:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "POST 'sign up'" do
    it "should sign up with email and password" do
      params = {:format => :json, :user => {:email => "user@example.com", :password => "password"}}
      post :create,  params
      expect(response.status).to eq(201)
    end
    it "should reject a sign up with no password" do
      params = {:format => :json, :user => {:email => "user@example.com", :password => ""} }
      post :create, params
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(parsed_response['password']).to_not be_empty
    end
  end
end