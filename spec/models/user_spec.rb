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
  
  describe '.to_s' do
    let!(:user) { create(:user) }
    
    it "returns the proper username value of user"do
      user.to_s.should == user.username
    end
  end
end
