class CreateDeductions < ActiveRecord::Migration[7.0]
  def change
    create_table :deductions do |t|
      t.float :pf
      t.float :epf
      t.float :tds
      
      t.timestamps
    end
  end
end
