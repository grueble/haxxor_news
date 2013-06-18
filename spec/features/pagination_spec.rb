require 'spec_helper'

describe "the 20 articles per page limit" do
  before do
    21.times do |n| 
      create(:article, :title => "Title #{n}")
      sleep(1)
    end
    visit '/articles'
  end
  
  it "it paginates articles" do
    page.should_not have_content "Title 0"
    click_link "2"
    page.should have_content "Title 0"
  end
end