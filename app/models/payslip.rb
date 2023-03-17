class Payslip < ApplicationRecord
  has_many :payslip_details
  validates :employment_id, :from_date, :to_date, :month, presence: true
end
