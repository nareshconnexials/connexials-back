class Leave < ApplicationRecord
  # attr_accessor  :user_id, :leave_type, :leave_balance, :start_date, :end_date, :day_count
  #validates :leave_type, inclusion: { in: %w(festival sick paid),
  #  message: "%{value} is not a valid leaves" }
  
  # has_many :user

end
