class RenameTypeToCategoryInPayslipDetails < ActiveRecord::Migration[7.0]

  def change
    rename_column :payslip_details, :type, :category
  end
end
