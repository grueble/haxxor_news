require 'spec_helper'

describe Article do
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:link) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:link) }
end