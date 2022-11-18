class User < ApplicationRecord
  has_secure_password
  has_many :leave
  enum role: [:employee, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :employee
    end
  end
end
