require 'spec_helper'

describe Comment do
  it { should allow_mass_assignment_of(:body) }
  it { should validate_presence_of(:body) }
  
  it { should belong_to(:commentable) }
end
