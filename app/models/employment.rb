class Employment < ApplicationRecord
  validates :designation, :department, :date_of_joining, :project_location, presence: true
end
