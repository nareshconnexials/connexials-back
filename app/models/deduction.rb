class Deduction < ApplicationRecord
  validates :pf, :epf, :tds, presence: true
end
