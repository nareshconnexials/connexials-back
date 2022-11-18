class Payslip < ApplicationRecord
  validates :from_date, :to_date, :month, presence: true
end
