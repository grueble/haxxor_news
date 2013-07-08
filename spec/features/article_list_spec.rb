require 'spec_helper'

describe "the article listing process" do
  let!(:article1) { create(:article, :created_at => 1.day.ago, :title => "Second") }
  let!(:article2) { create(:article, :created_at => 5.seconds.ago,  :title => "First") }
  let(:vote) { create(:upvote, :votable => :article1) }
  
  it "lists all articles" do
    visit '/'
    
    page.should have_content "First"
    page.should have_content "Second"
  end
  
  it "lists all articles by rating" do
    visit '/top-rated'
    
    page.should have_content "Second"
    page.should have_content "First"
  end
  
  it "lists all articles by rating for a particular year" do
    visit "/top-rated/#{Time.now.year}"
    
    page.should have_content "Second"
    page.should have_content "First"
  end
  
  it "lists all articles by rating for a particular month" do
    visit "/top-rated/#{Time.now.year}/#{Time.now.month}"
    
    page.should have_content "Second"
    page.should have_content "First"
  end
  
  it "lists all articles by rating for a particular day" do
    visit "/top-rated/#{Time.now.year}/#{Time.now.month}/#{Time.now.day}"
    
    page.should have_content "First"
    page.should_not have_content "Second"
  end
  
  it "lists all articles by newest" do
    visit '/newest'
    
    page.should have_content "First"
    page.should have_content "Second"
  end
  
  describe "the 20 articles per page limit" do
    before do
      21.times { |n| create(:article, :title => "Title #{n}", :created_at => 22.hours.ago + n.hours) }
      visit '/articles'
    end
  
    it "it paginates articles" do
      page.should_not have_content "Title 0"
      click_link "2"
      page.should have_content "Title 0"
    end
  end
end