require 'spec_helper'
describe ArtistsController do
  render_views
  include Devise::TestHelpers

  describe "GET 'index'" do
    it "should be able to access the page" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => 'Artists')
    end
  end

  describe "GET 'new'" do
    describe "failure" do
      it "should not be able to access the page" do
        get :new
        response.should_not be_success
      end
    end
    
    describe "success" do
      before(:each) do
      end
  
      it "should be able to access the page" do
        get :new
        response.should be_success
      end
      
      it "should be have the right title" do
        get :new
        response.should have_selector("title", :content => "New Artist")
      end
    end
  end
end
