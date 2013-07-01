require 'spec_helper'

describe SessionsController do
  let!(:user) { create(:user) }
  
  describe 'POST #create' do
    before { post :create , :username => user.username, :password => "password" }
    it "creates a new session" do
      session[:current_user_id].should == user.id
    end
  end
  
  describe 'DELETE #destroy' do
    before { delete :destroy, :method => 'delete' }
    it "destroys the current session" do
      session[:current_user_id].should be_nil
    end
  end
end
