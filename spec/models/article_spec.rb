require 'spec_helper'

describe Article do
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:link) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:link) }

  describe '.by_created_at' do
    let!(:article1) { create(:article, :created_at => 10.seconds.ago, :title => "Second") }
    let!(:article2) { create(:article, :created_at => 5.seconds.ago,  :title => "First") }
    
    it "returns all articles in the correct order" do
      Article.by_created_at.should == [ article2, article1 ]
    end
  end

  context 'validating link' do
    subject { Article.new(:title => "My Title") }
    
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
    subject { Article.new(:title => "My Title", :link => "http://www.example.com/location") }
    
    it "correctly isolates the domain of the URI" do
      subject.domain == "www.example.com"
    end
  end
end