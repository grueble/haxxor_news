require 'spec_helper'

describe Vote do
  subject { create(:vote) }
  
  it { should allow_mass_assignment_of(:sign) }
  
  it { should validate_uniqueness_of(:user_id).scoped_to(:votable_id, :votable_type) }
  
  it { should ensure_inclusion_of(:sign).in_array([-1, 1]) }
  
  it { should validate_presence_of(:sign) }
  
  it { should belong_to(:votable) }
  it { should belong_to(:user) }
end
