class Timeoff < ApplicationRecord
  belongs_to :user
  has_many :timeoff_allocations
end
