require 'rails_helper'

RSpec.describe User do
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  before (:each) do
    @user = create(:user)
  end

  context "when a user is created" do
    it "should have an authentication token" do
      expect(@user.authentication_token).to_not be(nil)
    end
  end

  describe ".reset_authentication_token!" do
    before do
      @token = @user.authentication_token
    end
    it "should reset authentication token value" do
      @user.reset_authentication_token!
      expect(@user.authentication_token).to_not eq(@token)
    end
  end

end