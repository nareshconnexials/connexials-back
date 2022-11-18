class LeaveAllocation < ApplicationRecord
  validates :month, :credit, :leave, :loss, :penalty, :compoff, presence: true
end
