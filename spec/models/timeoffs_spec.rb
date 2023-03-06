require 'rails_helper'

RSpec.describe Timeoff, :type => :model do
  describe "Validating associations" do
    context 'timeoff_allocations associations' do
      it { expect(described_class.reflect_on_association(:timeoff_allocations).macro).to eq(:has_many) }
    end

    context 'user associations' do
      it { expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to) }
    end
  end
end
