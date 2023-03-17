require 'rails_helper'

RSpec.describe Timeoff, :type => :model do
  describe "Validating associations" do
    it { should have_many(:timeoff_allocations).class_name('TimeoffAllocation') }
    it { should belong_to(:user).class_name('User') }
    it { should validate_presence_of(:from_date) }
    it { should validate_presence_of(:leave_type) }
    it { should validate_presence_of(:to_date) }
    it { should validate_presence_of(:session_start) }
    it { should validate_presence_of(:session_end) }
    it { should validate_presence_of(:notes) }
    it { should validate_presence_of(:from_date) }
    it { should validate_length_of(:notes).is_at_least(5) }

   end
end

