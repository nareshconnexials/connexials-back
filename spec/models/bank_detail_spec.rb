require 'rails_helper'

RSpec.describe BankDetail, :type => :model do
  it { should validate_presence_of(:bank_ac_no) }
  it { should validate_presence_of(:bank_name) }
  it { should validate_presence_of(:ifsc_code) }
  it { should validate_presence_of(:pan_no) }
  it { should validate_presence_of(:uan_no) }
end


