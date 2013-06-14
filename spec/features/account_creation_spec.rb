require 'spec_helper'

describe "the user creation process" do
  it "creates an account" do
    visit '/users/new'
    
    fill_in 'Username', :with => 'My Username'
    fill_in 'Password', :with => 'test-password'
    fill_in 'Password confirmation', :with => 'test-password'
    
    expect{ click_button 'Create' }.to change{ User.count }.by(1)
    
    page.should have_content 'My Username'
  end
  
  it "fails to create an account" do
    visit '/users/new'
    
    expect{ click_button 'Create' }.to_not change{ User.count }
    
    page.should have_content "Username can't be blank"
  end
end