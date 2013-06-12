require 'spec_helper'

describe "the article subimission process" do
  it "creates an article" do
    visit '/articles/new'
    
    fill_in 'Title', :with => 'My Article'
    fill_in 'Link', :with => 'http://example.com'
    
    expect{ click_button 'Create' }.to change{ Article.count }.by(1)
    
    page.should have_content 'My Article'
  end
  
  it "fails to create an article" do
    visit '/articles/new'
  
    fill_in 'Title', :with => ''
    fill_in 'Link', :with => ''
  
    click_button 'Create'
    
    page.should have_content "Title can't be blank"
  end
end