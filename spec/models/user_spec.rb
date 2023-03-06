require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Validating associations" do
    it { should have_many(:timeoffs).class_name('Timeoff') }
  end
end
