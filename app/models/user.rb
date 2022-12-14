class User < ApplicationRecord
  has_secure_password
  enum role: [:employee, :admin]

  ## Assocation
  has_many :timeoffs

  ## Callback
  after_initialize do
    if self.new_record?
      self.role ||= :employee
    end
  end
end
