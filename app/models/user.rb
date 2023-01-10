class User < ApplicationRecord
  has_secure_password
  has_many :holidays
  validates :first_name, :last_name, :email, presence: true
  
  enum role: [:employee, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :employee
    end
  end
end
