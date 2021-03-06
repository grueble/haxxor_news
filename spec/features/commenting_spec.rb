require 'spec_helper'

describe "the comment submission process" do
  let(:user) { create(:user, :username => "My Username", :password => "password", :password_confirmation => "password") }
  let(:article) { create(:article) }
  let(:comment) { create(:comment, :commentable => article) }
  
  context 'signed in' do
    before do 
      sign_in_as(user)
    end
    
    it "creates a comment on an article" do
      visit "/articles/#{article.id}"
      
      fill_in 'comment_body', :with => "Generic Text Submission"
      
      click_button "Add Comment"
      
      page.should have_content 'Generic Text Submission'
    end
    
    it "is unable to create a comment with no body on an article" do
      visit "/articles/#{article.id}"
      
      click_button "Add Comment"
      
      page.should have_content "Comment must have text"
    end
    
    it "is able to view an individual comment" do
      visit "/comments/#{comment.id}"
      
      page.should have_content "Insert Text Here"
    end
    
    it "creates a comment on a comment" do
      visit "/comments/#{comment.id}"
      
      fill_in 'comment_body', :with => "Generic Text Submission"
      
      click_button "Add Comment"
      
      page.should have_content "Generic Text Submission"
    end
    
    it "is unable to create a comment with no body on an comment" do
      visit "/comments/#{comment.id}"
      
      click_button "Add Comment"
      
      page.should have_content "Comment must have text"
    end
  end
end