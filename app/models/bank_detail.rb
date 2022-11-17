class BankDetail < ApplicationRecord
  validates :bank_ac_no, :bank_name, :ifsc_code, :pan_no, :uan_no, presence: true
end
