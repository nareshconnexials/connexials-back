class Timeoff < ApplicationRecord
  belongs_to :user
  has_many :timeoff_allocations

  validates  :leave_type, presence: true 
    validates  :from_date, presence: true 
    validates  :to_date, presence: true 
    validates  :session_start, presence: true 
    validates  :session_end, presence: true 
    validates  :notes, presence: true, length: {minimum:5}
    validate   :from_date_must_be_greater_than_to_date
    validate   :notes_must_be_present

    #belongs_to :user, class_name: "User"

    enum :session_start, [:session1, :session2], _suffix: true
    enum :session_end, [:session1, :session2], prefix: :session_end
    enum :leave_type, [:annual_leave, :loss_of_pay, :marriage_leave, :sick_leave]
    enum :status, [:pending, :approved, :rejected, :withdrawn]

    def from_date_must_be_greater_than_to_date 
      return nil unless from_date
      unless from_date < to_date 
        errors.add(:start_date, "must be greater than to date")
      end
    end

    def notes_must_be_present 
      if notes.length > 0 and notes.blank? 
        errors.add(:notes, "can not be empty")
      end
    end


end
