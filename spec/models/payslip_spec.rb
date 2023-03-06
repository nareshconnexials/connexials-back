require 'rails_helper'

RSpec.describe Payslip, :type => :model do
  it { should validate_presence_of(:from_date) }
  it { should validate_presence_of(:to_date) }
  it { should validate_presence_of(:month) }
end
