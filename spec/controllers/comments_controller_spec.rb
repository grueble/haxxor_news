require 'spec_helper'

describe CommentsController do
  let(:article) { create(:article) }

  context "signed out" do
    it "is unable to create a comment when no user is signed in" do  
      expect {
        post :create, :comment => { :body => "" }, :article_id => article.id
      }.to_not change{ Comment.count }
    end
  end
end