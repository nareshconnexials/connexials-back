require 'rails_helper'

RSpec.describe TimeoffAllocation, :type => :model do
  describe "Validating associations" do
    it { should belong_to(:timeoff).class_name('Timeoff') }
  end
end
