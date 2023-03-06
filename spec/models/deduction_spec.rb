require 'rails_helper'

RSpec.describe Deduction, :type => :model do
  it { should validate_presence_of(:pf) }
  it { should validate_presence_of(:epf) }
  it { should validate_presence_of(:tds) }
end


