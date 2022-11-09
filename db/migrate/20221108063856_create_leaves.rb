class CreateLeaves < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :leave_type

      t.timestamps
    end
  end
end
