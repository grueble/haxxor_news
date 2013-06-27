shared_examples "a votable" do
  it { should have_many(:votes) }
  
  describe '#vote_for_user' do
    let(:user) { create(:user) }

    it "find an existing vote for the provided user" do
      vote = create(:upvote, :votable => subject, :user => user)
      subject.vote_for_user(user).should == vote
    end

    it "builds a vote for the existing user if one does not exist" do
      create(:upvote, :votable => subject)
      subject.vote_for_user(user).should be_new_record
    end
  end
  
  describe '#score' do
    it "correctly sums the score of a votable object" do 
      create(:upvote, :votable => subject, :user => create(:user), :sign => 1)
      create(:upvote, :votable => subject, :user => create(:user), :sign => 1)
      create(:downvote, :votable => subject, :user => create(:user), :sign => -1)
      
      subject.score.should == 1
    end
  end
end