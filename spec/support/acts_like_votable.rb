shared_examples "a votable" do
  it { should have_many(:votes) }
  
  describe '#vote_for_user' do
    let(:user){ create(:user) }

    it "find an existing vote for the provided user" do
      vote = create(:vote, :votable => subject, :user => user)
      subject.vote_for_user(user).should == vote
    end

    it "builds a vote for the existing user if one does not exist" do
      subject.vote_for_user(user).should be_new_record
    end
  end
end