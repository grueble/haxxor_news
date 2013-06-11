require 'spec_helper'

describe Article do
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:link) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:link) }
  
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
end