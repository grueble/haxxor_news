require 'spec_helper'

describe User do
  subject { create(:user) }
  
  it { should allow_mass_assignment_of(:username) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }

  it { should validate_uniqueness_of(:username) }

  it { should ensure_length_of(:username).is_at_most(50) }

  it { should have_many(:articles) }
  
  it { should have_many(:comments) }
  
  it { should have_many(:votes) }
  
  describe '#to_s' do
    subject { create(:user) }
    
    it "returns the proper username value of username" do
      subject.to_s.should == subject.username
    end
  end
end
