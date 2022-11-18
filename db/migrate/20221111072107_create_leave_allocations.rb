class CreateLeaveAllocations < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_allocations do |t|
      t.datetime :month
      t.float :credit
      t.float :count
      t.float :loss
      t.float :penalty
      t.float :compoff

      t.timestamps
    end
  end
end
