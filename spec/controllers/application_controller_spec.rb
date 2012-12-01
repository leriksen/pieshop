require 'spec_helper'

describe ApplicationController do
  Bookshop::Application.routes do |map|
    get :current_user , to: "application#current_user", as: :current_user
  end
  
  describe "a before_filter" do
    it "should work" do 
      get :current_user
      session[:user_id].should eql(1) 
    end
  end 
end
