require 'rails_helper'

RSpec.describe Timeoff, :type => :model do
  describe "Validating associations" do
    it { should have_many(:timeoff_allocations).class_name('TimeoffAllocation') }
    it { should belong_to(:user).class_name('User') }
  end
end
