require 'spec_helper'

describe "the article listing process" do
  it "lists all articles" do
    article1 = Article.create(:title => "First", :link => "http://www.example.com")
    
    visit '/articles'
    
    page.should have_content "First"
    page.should have_content "www.example.com"
  end
  
  it "lists articles in the proper order" do
    article1 = Article.create(:title => "First", :link => "http://www.example.com")
    article2 = Article.create(:title => "Second", :link => "http://www.example.com")
    
    article1.created_at = Time.now - 1.day
    article2.created_at = Time.now
    
    visit '/articles'
    
    Article.first.id.should equal(article1.id)
  end
end
