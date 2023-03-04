class User < ApplicationRecord
  has_secure_password
  enum role: [:employee, :admin]

  ## Assocation
  has_many :timeoffs
  has_many :leaves, class_name: "Leave", foreign_key: "user_id"

  ## Callback
  after_initialize do
    if self.new_record?
      self.role ||= :employee
    end
  end
end
