require 'spec_helper'

describe "the article listing process" do
  it "lists all articles" do
    article1 = Article.create(:title => "First", :link => "http://www.example.com")
    
    visit '/articles'
    
    page.should have_content "First"
    page.should have_content "www.example.com"
  end
  
  
end
