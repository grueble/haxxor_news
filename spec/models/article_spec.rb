require 'spec_helper'

describe Article do
  subject { create(:article) }

  it_should_behave_like "a votable"

  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:link) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:user_id) }
  
  it { should belong_to(:user) }

  it { should have_many(:comments) }

  describe '.by_created_at' do
    let!(:article1) { create(:article, :created_at => 10.seconds.ago, :title => "Second") }
    let!(:article2) { create(:article, :created_at => 5.seconds.ago,  :title => "First") }
    
    it "returns all articles in the correct order" do
      Article.by_created_at.should == [ article2, article1 ]
    end
  end
  
  describe '.by_rating' do
    let!(:article1) { create(:article) }
    let!(:article2) { create(:article) }
    let!(:article3) { create(:article) }
    
    it "returns all articles in the correct order" do
      2.times { create(:upvote, :votable => article1) }
      create(:upvote, :votable => article2)
      Article.by_rating.should == [ article1, article2, article3 ]
    end
  end

  context 'validating link' do
    subject { build(:article) }
    
    it "is invalid with a bad URI" do
      subject.link = "not a url"
      subject.should be_invalid
    end

    it "is invalid with an non-HTTP URI" do
      subject.link = "ftp://example.com/path/to/file"
      subject.should be_invalid
    end
  
    it "is valid with a good URI" do
      subject.link = "http://www.example.com/location"
      subject.should be_valid
    end
  end
  
  context 'testing domain method' do
    subject { build(:article, :link => "http://www.example.com/location") }
    
    it "correctly isolates the domain of the URI" do
      subject.domain == "www.example.com"
    end
  end
end