require 'rails_helper'

RSpec.describe Allowance, :type => :model do
  it { should validate_presence_of(:basic_salary) }
  it { should validate_presence_of(:hra) }
  it { should validate_presence_of(:special_allowance) }
end

