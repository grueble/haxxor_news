require 'spec_helper'

describe "the sign in process" do
  let!(:user) { create(:user, :username => "My Username", :password => "password", :password_confirmation => "password") }
  
  context 'signed out' do
    it "signs a user in" do
      visit '/session/new'
      
      fill_in 'username', :with => "My Username"
      fill_in 'password', :with => 'password'
      
      click_button 'Sign In'
      
      page.should have_content "You have successfully been signed in" 
    end
    
    it "fails to sign a user in" do
      visit '/session/new'
      
      click_button 'Sign In'
      
      page.should have_content "Invalid username/password combination"
    end
  end

  context 'signed in' do
    before do
      sign_in_as(user)
    end
    
    it "signs a user out, i.e ends the session" do
      visit '/articles'

      click_button 'Sign Out'

      page.should have_content "You have successfully been signed out"
    end
    
    it "is unable to create a new user" do
      visit '/users/new'

      page.should have_content 'You must be logged out to perform this action'
    end
  end
end