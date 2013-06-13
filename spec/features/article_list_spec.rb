require 'spec_helper'

describe "the article listing process" do
  let!(:article1) { Article.create(:title => "First", :link => "http://www.example.com") }
  let!(:article2) { Article.create(:title => "Second", :link => "http://www.example.com") }
  
  it "lists all articles" do
    visit '/articles'
    
    page.should have_content "First"
    page.should have_content "www.example.com"
  end
  
  it "lists articles in the proper order" do
    article1.created_at = 10.seconds.ago 
    article2.created_at = 5.seconds.ago 
    
    visit '/articles'
    
    Article.first.id.should equal(article1.id)
  end
end
