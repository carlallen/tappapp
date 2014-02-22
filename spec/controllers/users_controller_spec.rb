require 'spec_helper'

describe UsersController do
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
  end

  describe "GET 'index'" do
    before { get :index }
    it "should be successful" do
      response.should be_success
    end
  end

  describe "GET 'new'" do
    before { get :new }
    it "should be successful" do
      response.should be_success
    end
  end
end
