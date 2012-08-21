require 'spec_helper'
describe PagesController do
  render_views
  include Devise::TestHelpers
  
  describe 'accessing home page' do
    it "should be able to access the page" do 
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content => "Home")
    end
  end

  describe 'accessing about page' do
    it "should be able to access the page" do
      get 'about'
      response.should be_success
    end 
    
    it "should have the right title" do
      get 'about'
      response.should have_selector("title", :content => "About")
    end
  end

  describe 'accessing contact page' do
    it "should be able to access the page" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_selector("title", :content => "Contact")
    end
  end

end
