class PayslipDetail < ApplicationRecord
    belongs_to :payslip
    validates :amount, :name, presence: true
    validates :amount, numericality: { greater_than: 0 }
    enum type: [:allowance, :deduction]
end
