require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Validating associations" do
    context 'timeoffs associations' do
      it { expect(described_class.reflect_on_association(:timeoffs).macro).to eq(:has_many) }
    end
  end
end
