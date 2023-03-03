class AddLeavesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.integer :leave_type
      t.date :from_date 
      t.date :to_date 
      t.integer :session_start
      t.integer :session_end
      t.string :notes
      t.integer :status
      t.timestamps

      t.belongs_to :user
      t.index :from_date
      t.index :to_date
    end
  end
end
