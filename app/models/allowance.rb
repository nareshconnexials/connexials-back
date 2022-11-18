class Allowance < ApplicationRecord
  validates :basic_salary, :hra, :special_allowance, presence: true
end
