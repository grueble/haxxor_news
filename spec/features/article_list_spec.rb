require 'spec_helper'

describe "the article listing process" do
  let!(:article1) { create(:article, :created_at => 10.seconds.ago, :title => "Second") }
  let!(:article2) { create(:article, :created_at => 5.seconds.ago,  :title => "First") }
  
  it "lists all articles" do
    visit '/articles'
    
    page.should have_content "First"
    page.should have_content "Second"
  end
  
  describe "the 20 articles per page limit" do
    before do
      21.times { |n| create(:article, :title => "Title #{n}", :created_at => Time.now + n.seconds) }
      visit '/articles'
    end
  
    it "it paginates articles" do
      page.should_not have_content "Title 0"
      click_link "2"
      page.should have_content "Title 0"
    end
  end
end