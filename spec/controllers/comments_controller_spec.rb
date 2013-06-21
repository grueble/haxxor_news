require 'spec_helper'

describe CommentsController do
  let(:user) { create(:user) }
  let(:article) { create(:article) }
  context "signed out" do
    it "is unable to create a comment when no user is signed in" do  
      expect {
        post :create, :comment => { :body => "" }, :article_id => article.id
      }.to_not change{ Comment.count }
    end
  end
  
  context "signed in" do
    before do 
      login_as(user)
    end
    describe "adding a comment" do
      context "with invalid data" do
        before { post :create, :comment => { } }
        describe "the request" do    
          it { should redirect_to(root_url) }
        end
        
        describe "the alert" do
          it { should set_the_flash.to("We weren't able to save your comment at this time") }
        end
      end
    end
  end
end