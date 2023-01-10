class CreateAllocations < ActiveRecord::Migration[7.0]
  def change
    create_table :allocations do |t|
      t.integer :leave_id
      t.datetime :month
      t.float :credit
      t.float :leave
      t.float :penalty
      t.float :compoff

      t.timestamps
    end
  end
end
