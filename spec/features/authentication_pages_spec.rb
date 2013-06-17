require 'spec_helper'

describe "the sign in process" do
  let!(:tempuser) { create(:user, :username => "My Username", :password => "password", :password_confirmation => "password") }
  
  it "signs a user in" do
    visit '/session/new'
    
    fill_in 'Username', :with => "My Username"
    fill_in 'Password', :with => 'password'
    
    click_button 'Sign In'
    
    page.should have_content "You have successfully been signed in" 
  end
  
  it "fails to sign a user in" do
    visit '/session/new'
    
    click_button 'Sign In'
    
    page.should have_content "Invalid username/password combination"
  end

  context 'signed in' do
    before do
      visit '/session/new'

      fill_in 'Username', :with => "My Username"
      fill_in 'Password', :with => 'password'

      click_button 'Sign In'
    end
    
    it "signs a user out, i.e ends the session" do
      visit '/articles'

      click_button 'Sign Out'

      page.should have_content "You have successfully been signed out"
    end
  end
end