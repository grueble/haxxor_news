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
        
        expect{ click_button 'Upvote' }.to change{ Vote.where(:sign => 1).count }.by(1)
      end
      
      it "creates an upvote on a comment" do 
        visit "/comments/#{comment.id}"
        
        expect{ click_button 'Upvote' }.to change{ Vote.where(:sign => 1).count }.by(1)
      end
    end
    
    describe "the downvote process" do
      it "creates an downvote on an article" do 
        visit "/articles/#{article.id}"
        
        expect{ click_button 'Downvote' }.to change{ Vote.where(:sign => -1).count }.by(1)
      end
      
      it "creates an downvote on a comment" do 
        visit "/comments/#{comment.id}"
        
        expect{ click_button 'Downvote' }.to change{ Vote.where(:sign => -1).count }.by(1)
      end
    end
  end
end