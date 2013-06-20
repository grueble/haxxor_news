require 'spec_helper'

describe Comment do
  it { should allow_mass_assignment_of(:body) }
  it { should allow_mass_assignment_of(:commentable_id) }
  it { should allow_mass_assignment_of(:commentable_type) }
  
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }
  
  it { should belong_to(:commentable) }
  
  it { should belong_to(:user) }
  
  it { should have_many(:comments) }
end
