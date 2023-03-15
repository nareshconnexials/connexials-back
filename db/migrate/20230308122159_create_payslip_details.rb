class CreatePayslipDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payslip_details do |t|
      t.float :amount
      t.string :name
      t.integer :type
      t.references :payslip, foreign_key: true
      t.timestamps
    end
  end
end
