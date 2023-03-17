class AddColoumnsToPayslip < ActiveRecord::Migration[7.0]
  def change    
    add_column :payslips, :gross_salary, :float
    add_column :payslips, :net_salary, :float
  end
end
