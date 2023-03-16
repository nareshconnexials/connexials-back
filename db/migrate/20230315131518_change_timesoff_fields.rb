class ChangeTimesoffFields < ActiveRecord::Migration[7.0]
  def change
    add_column :timeoffs, :leave_type, :integer
    add_column :timeoffs, :session_start, :integer
    add_column :timeoffs, :session_end, :integer
    add_column :timeoffs, :notes, :string
    add_column :timeoffs, :status, :integer
    add_index :timeoffs, :from_date
    add_index :timeoffs, :to_date
    remove_column :timeoffs, :from_session, :string
    remove_column :timeoffs, :to_session, :string
    remove_column :timeoffs, :days, :string
    remove_column :timeoffs, :mail_to, :string
    remove_column :timeoffs, :reason, :string
  end
end

