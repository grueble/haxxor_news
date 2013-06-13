require 'spec_helper'

describe User do
  let!(:user1) { create(:user) }
  
  subject { user1 }
  
  it { should allow_mass_assignment_of(:username) }
  it { should allow_mass_assignment_of(:password) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:username) }
  it { should ensure_length_of(:username).is_at_most(50) }
end
