require 'spec_helper'

describe SessionsController do
  let!(:user) { User.create }
  
  #test to see if user id value is correct
  
  describe 'POST #create' do
    before { post :create , :username => user.username, :password => "password" }
    it "creates a new session" do
      session[:current_user_id].should == user.id
    end
  end
  
  describe 'DELETE #destroy' do
    before { delete :destroy }
    it "destroys the current session" do
      session[:current_user_id].should == nil
    end
  end
end
