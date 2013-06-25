require 'spec_helper'

describe 'the voting process' do
  let(:user) { create(:user) }
  let(:article) { create(:article) }
  let(:comment) { create(:comment) }
  
  context "signed in" do
    before do 
      sign_in_as(user)
    end
    
    it "creates an upvote on an article" do 
      visit "/articles/#{article.id}"
      
      expect{ click_button 'Upvote' }.to change{ Vote.count }.by(1)
    end
    
    it "creates an upvote on an comment" do 
      visit "/comments/#{comment.id}"
      
      expect{ click_button 'Upvote' }.to change{ Vote.count }.by(1)
    end
  end
end