class CreateLeaves < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.integer :user_id
      t.date :from_date
      t.date :to_date
     # t.string :leave_type
      t.string :from_session
      t.string :to_session
      t.string :days
      t.string :mail_to
      t.string :reason
      
      t.timestamps
    end
  end
end
