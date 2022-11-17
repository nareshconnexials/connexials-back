class CreateAllowances < ActiveRecord::Migration[7.0]
  def change
    create_table :allowances do |t|
      t.float :basic_salary
      t.float :hra
      t.float :special_allowance
    
      t.timestamps
    end
  end
end
