require 'spec_helper'

describe 'the voting process' do
  let(:user) { create(:user) }
  let(:article) { create(:article) }
  let(:comment) { create(:comment) }
  
  context "signed in" do
    before do 
      sign_in_as(user)
    end
    describe "the upvote process" do
      it "creates an upvote on an article" do 
        visit "/articles/#{article.id}"
        
        expect{ click_button 'Upvote' }.to change{ Vote.count }.by(1)
      end
      
      it "creates an upvote on a comment" do 
        visit "/comments/#{comment.id}"
        
        expect{ click_button 'Upvote' }.to change{ Vote.count }.by(1)
      end
    end
    
    describe "the downvote process" do
      it "destroys an upvote on an article" do 
        visit "/articles/#{article.id}"
        
        click_button 'Upvote'
        
        expect{ click_button 'Downvote' }.to change{ Vote.count }.from(1).to(0)
      end
      
      it "destroys an upvote on a comment" do 
        visit "/comments/#{comment.id}"
        
        click_button 'Upvote'
        
        expect{ click_button 'Downvote' }.to change{ Vote.count }.from(1).to(0)
      end
    end
  end
end