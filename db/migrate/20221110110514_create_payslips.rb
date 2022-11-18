class CreatePayslips < ActiveRecord::Migration[7.0]
  def change
    create_table :payslips do |t|
      t.integer :employment_id
      t.date :from_date
      t.date :to_date
      t.datetime :month
      
      t.timestamps
    end
  end
end
