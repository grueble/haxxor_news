require 'spec_helper'

describe "the article listing process" do
  let!(:article1) { create(:article, :created_at => 10.seconds.ago, :title => "Second") }
  let!(:article2) { create(:article, :created_at => 5.seconds.ago,  :title => "First") }
  
  it "lists all articles" do
    visit '/articles'
    
    page.should have_content "First"
    page.should have_content "Second"
  end
end