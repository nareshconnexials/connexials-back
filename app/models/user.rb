class User < ApplicationRecord
  has_secure_password
  enum role: [:employee, :admin]

  ## Assocation
  #has_many :timeoffs
  has_many :timeoffs, class_name: "Timeoff", foreign_key: "user_id"

  ## Callback
  after_initialize do
    if self.new_record?
      self.role ||= :employee
    end
  end
end
